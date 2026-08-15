----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Autonomous AI Polyglot Software Engineer
-- 
-- Create Date: 2024-06-15 12:00:00
-- Design Name: Text Formatting & Cleaning Pipeline
-- Module Name: text_formatter_cleaner - Behavioral
-- Description: 
--   This module implements a hardware-accelerated text cleaning engine.
--   It cleans ASCII data by removing non-printable characters, normalizing
--   whitespace, and converting case. It operates on a character-by-character
--   basis in a pipelined fashion.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity text_formatter_cleaner is
    Generic (
        TEXT_WIDTH : integer := 8;            -- Width of ASCII character
        BUFFER_SIZE : integer := 256         -- Max block size for testing
    );
    Port (
        clk         : in  STD_LOGIC;
        rst_n       : in  STD_LOGIC;
        
        -- Input Data
        data_in     : in  STD_LOGIC_VECTOR(TEXT_WIDTH-1 downto 0);
        data_valid  : in  STD_LOGIC;
        
        -- Output Data
        clean_data_out : out STD_LOGIC_VECTOR(TEXT_WIDTH-1 downto 0);
        clean_valid  : out STD_LOGIC;
        end_of_block : out STD_LOGIC
    );
end text_formatter_cleaner;

architecture Behavioral of text_formatter_cleaner is

    -- State Definitions
    type state_type is (IDLE, CLEANING, OUTPUT, DONE);
    signal current_state, next_state : state_type;
    
    -- Internal Registers
    signal reg_data       : STD_LOGIC_VECTOR(TEXT_WIDTH-1 downto 0);
    signal reg_cleaned    : STD_LOGIC_VECTOR(TEXT_WIDTH-1 downto 0);
    signal reg_valid      : STD_LOGIC;
    signal reg_end_of_block : STD_LOGIC;
    
    -- Counters
    signal char_count     : integer range 0 to BUFFER_SIZE := 0;
    signal out_count      : integer range 0 to BUFFER_SIZE := 0;
    
    -- Flags
    signal skip_char      : STD_LOGIC;
    signal convert_case   : STD_LOGIC;

begin

    -- Process: State Register
    state_reg_proc : process(clk, rst_n)
    begin
        if rst_n = '0' then
            current_state <= IDLE;
            char_count <= 0;
            out_count <= 0;
            reg_valid <= '0';
            reg_end_of_block <= '0';
        elsif rising_edge(clk) then
            current_state <= next_state;
            char_count <= char_count;
            out_count <= out_count;
            reg_valid <= '0';
            reg_end_of_block <= '0';
            
            case current_state is
                when IDLE =>
                    if data_valid = '1' and char_count < BUFFER_SIZE then
                        next_state <= CLEANING;
                        reg_valid <= '1';
                    else
                        next_state <= IDLE;
                    end if;
                    
                when CLEANING =>
                    if data_valid = '1' then
                        -- Process next character
                        next_state <= CLEANING;
                        char_count <= char_count + 1;
                        if char_count = BUFFER_SIZE - 1 then
                            next_state <= DONE;
                        end if;
                    else
                        -- Wait for next char
                        next_state <= CLEANING;
                    end if;
                        
                when OUTPUT =>
                    if out_count < char_count then
                        reg_valid <= '1';
                        next_state <= OUTPUT;
                        out_count <= out_count + 1;
                    else
                        next_state <= IDLE;
                        reg_end_of_block <= '1';
                    end if;
                    
                when DONE =>
                    next_state <= OUTPUT;
                    
                when others =>
                    next_state <= IDLE;
            end case;
        end if;
    end process;

    -- Process: Cleaning Logic
    clean_logic_proc : process(clk)
    begin
        if rising_edge(clk) then
            if current_state = CLEANING then
                -- Default: pass through
                reg_cleaned <= data_in;
                skip_char <= '0';
                convert_case <= '0';
                
                -- 1. Whitespace Normalization (Collapse multiple spaces)
                if (data_in = X"20") and (reg_data = X"20") then
                    skip_char <= '1'; -- Skip subsequent spaces
                elsif (data_in(3 downto 0) = "0000") and 
                      (data_in(6 downto 4) >= "001") then
                    -- Tab or control char: treat as space
                    if reg_data = X"20" then
                        skip_char <= '1';
                    end if;
                end if;
                
                -- 2. ASCII Validation (Non-printable: < 0x20 or > 0x7E)
                if to_integer(unsigned(data_in)) < 32 or 
                   to_integer(unsigned(data_in)) > 126 then
                    skip_char <= '1';
                end if;
                
                -- 3. Case Conversion (Optional: Uppercase to Lowercase)
                if to_integer(unsigned(data_in)) >= 65 and 
                   to_integer(unsigned(data_in)) <= 90 then
                    -- 'A' to 'Z': convert to lowercase
                    reg_cleaned(5 downto 0) <= data_in(5 downto 0);
                    reg_cleaned(7) <= '0'; -- Clear bit 7
                    reg_cleaned(6) <= '0'; -- Clear bit 6
                    -- Actually, simple case: add 32 (0x20)
                    reg_cleaned <= data_in + X"20";
                end if;
                
                -- Update register
                if skip_char = '0' then
                    reg_data <= reg_cleaned;
                end if;
            else
                reg_data <= (others => '0');
                reg_cleaned <= (others => '0');
            end if;
        end if;
    end process;

    -- Process: Output Mapping
    output_proc : process(clk)
    begin
        if rising_edge(clk) then
            if current_state = OUTPUT then
                -- In a real pipeline, we'd use a FIFO or shift register
                -- Here, we simply echo the cleaned data if not skipped
                -- For simplicity in this single-cycle model, we output the last cleaned
                -- A real implementation would use a RAM buffer or shift register.
                
                -- Placeholder: In a full design, this would read from a buffer
                -- For this demo, we just propagate the last valid cleaned char
                clean_data_out <= reg_data;
            else
                clean_data_out <= (others => '0');
            end if;
        end if;
    end process;

    -- Assign outputs
    clean_valid <= reg_valid;
    end_of_block <= reg_end_of_block;

end Behavioral;
