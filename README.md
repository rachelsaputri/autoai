## context


<think>The user wants a continuation of the documentation for a project that builds a self-sufficient AI system. The new content should cover the next part after “Desain Arsitektur”. The user wants a follow-up section. Based on the instructions:

System: "Anda adalah penulis dokumentasi teknis. Tuliskan konten lanjutan yang komprehensif, terstruktur, gunakan list atau tabel jika perlu, dan langsung menambah nilai informasi."

The previous prompt: "Buatlah bagian 'Desain Arsitektur' ...". So they likely already have a section titled "Desain Arsitektur". They now want something else, perhaps "Implementasi", "Modul Utama", "Alur Kerja", "Komponen Sistem", "Rencana Pengembangan", "Pengujian", "Konfigurasi", "Instalasi", "Deployment", "Panduan Pemeliharaan". The content should be a new section to be appended to the README.md.

The user: "Tuliskan bab/materi lanjutan untuk ditempel ke README.md. Gunakan format Markdown yang rapi."

Thus we need to output the new content, in Markdown, structured, with headings, bullet points, tables where needed. No extra explanation. Just the content.

Let's think of a suitable title. After architecture design, the natural next step is "Implementasi". Or "Modul‑Modul Utama" or "Komponen Inti" describing the core modules: inference engine, knowledge base, reinforcement learning loop, safety layer, resource manager, etc. Provide a description, responsibilities, APIs, data flows. Provide a diagram (maybe using mermaid). Use bullet list for each module.

Alternatively, we could cover "Rencana Pengujian" (Testing Plan) and "Strategi Deployment" (Deployment). But "Implementasi" seems appropriate.

We need to make it comprehensive. Provide details for each module: "Inferensi Model", "Pemrosesan Knowledge", "Manajemen Sumber Daya", "Keamanan & Audit", "Integrasi Eksternal". Provide for each: deskripsi, input/output, API endpoint, dependencies. Use tables for quick view: Module | Fungsi | API Endpoint | Teknologi |.

Include subsections: "Arsitektur Kode", "Struktur Direktori". Use code snippet.

We might also include "Konfigurasi dan Parameter". Provide environment variables list.

Make it suitable for a README, which should be concise but thorough. Use headings with ##.

Thus, final answer: The new section in markdown, to be appended after "Desain Arsitektur". Should be ready to copy-paste.

Make sure we don't include extra description, just the markdown content.

Thus I'll produce:

## Implementasi

### Overview

...

Then subsections.

Write in Indonesian.

Make it thorough.

Proceed.
</think>

## Implementasi  

### Gambaran Umum  
Implementasi sistem AI swadaya dibagi menjadi beberapa modul inti yang saling interoperabel. Setiap modul dirancang untuk menangani tanggung jawab spesifik, berkomunikasi melalui antarmuka API internal, dan dapat di‑deploy secara independen (misalnya via kontainer Docker).  

### Modul‑Modul Utama  

| Modul | Fungsi Utama | Endpoint API | Teknologi Pendukung | Bahasa Pemrograman |
|-------|--------------|--------------|----------------------|--------------------|
| **Inference Engine** | Menjalankan model bahasa besar (LLM) untuk inferensi dan generation teks. | `POST /api/v1/infer` | ONNX Runtime, TensorRT (GPU), vLLM | Python (FastAPI) |
| **Knowledge Base** | Menyimpan dan retrieve dokumen, fakta, dan hasil reasoning. | `GET/POST /api/v1/knowledge` | Elasticsearch, Neo4j (graph) | Python, Java (GraphQL) |
| **Learning Loop** | Menjalankan fine‑tuning, reinforcement learning dari umpan balik real‑time. | `POST /api/v1/train` | Ray, RLlib | Python (Ray) |
| **Safety & Compliance** | Menerapkan filter konten, audit, dan policy enforcement. | `POST /api/v1/safety/check` | OpenAI Moderation API, regex‑based rules | Python |
| **Resource Manager** | Mengatur alokasi GPU, CPU, dan quota request secara dinamis. | `GET /api/v1/resource/status` | Kubernetes API, Prometheus | Go |
| **Feedback Collector** | Mengumpulkan dan menganalisis umpan balik pengguna. | `POST /api/v1/feedback` | Kafka, Fluentd | Python |
| **External Integrator** | Menghubungkan layanan pihak ketiga (mis. payment, notification). | `POST /api/v1/external/<service>` | REST / gRPC, OAuth2 | Node.js (TypeScript) |

#### Detail Setiap Modul  

##### 1. Inference Engine  
- **Responsibility:** Menerima prompt, memilih model yang sesuai, dan mengembalikan teks hasil inferensi.  
- **Input:** JSON `{ "prompt": "<string>", "model": "<model_id>", "max_tokens": <int>, "temperature": <float> }`  
- **Output:** JSON `{ "text": "<generated_text>", "tokens_used": <int>, "latency_ms": <int> }`  
- **Scaling:** Menggunakan model sharding (Tensor Parallelism) pada klaster GPU. Horizontal scaling dicapai melalui layanan API Gateway yang membagi traffic.  

##### 2. Knowledge Base  
- **Responsibility:** Menyimpan knowledge graphs, vektor embeddings, dan dokumen statis yang digunakan selama reasoning.  
- **Indexing:** Dokumen di‑embed menggunakan model `sentence-transformers`; vektor disimpan di Elasticsearch. Graph knowledge (fakta relasional) dikelola dalam Neo4j.  
- **Query:** `GET /api/v1/knowledge?q=<query>` → mengembalikan hasil relevan (top‑k) serta confidence score.  

##### 3. Learning Loop  
- **Responsibility:** Meng‑fine‑tune model secara berkala berdasarkan data feedback dan reward signal.  
- **Pipeline:**  
  1. **Sampling** – Mengambil subset interaksi dari Feedback Collector.  
  2. **Reward Computation** – Menghitung skor reward berdasarkan kriteria (keakuratan, safety, helpfulness).  
  3. **Training** – Menjalankan distributed training dengan Ray; checkpoint model disimpan ke object storage (MinIO).  
  4. **Evaluation** – Menjalankan evaluasi otomatis (BLEU, ROUGE, LLM‑based metrics).  
- **Trigger:** Training dapat dijadwalkan (cron) atau dipicu oleh akumulasi data tertentu.  

##### 4. Safety & Compliance  
- **Responsibility:** Memfilter konten yang tidak aman atau melanggar kebijakan sebelum dan sesudah inferensi.  
- **Checks:**  
  - Pre‑inference: Prompt checking (regex, keyword blocking).  
  - Post‑inference: Moderasi teks (model‑based atau rule‑based).  
- **Audit Log:** Setiap keputusan safety dicatat dalam Elasticsearch untuk audit trail.  

##### 5. Resource Manager  
- **Responsibility:** Mengawasi utilisasi GPU/CPU, menerapkan quota per tenant, dan menangani autoscaling.  
- **Metrics:** Diekspos melalui endpoint `/metrics` (Prometheus format) dan dapat di‑visualisasikan di Grafana.  
- **Autoscaling:** Berdasarkan RPS (requests per second) dan latensi; menggunakan Horizontal Pod Autoscaler (HPA) pada Kubernetes.  

##### 6. Feedback Collector  
- **Responsibility:** Mengumpulkan feedback eksplisit (rating, komentar) dan implisit (interaksi, dwell time).  
- **Transport:** Events dikirim ke Kafka topic `feedback.raw`; selanjutnya di‑consume oleh Learning Loop.  

##### 7. External Integrator  
- **Responsibility:** Menyediakan antarmuka ke layanan eksternal (pembayaran, notifikasi, third‑party API).  
- **Authentication:** Menggunakan OAuth2 client credentials flow.  
- **Error Handling:** Retri dengan exponential back‑off, circuit breaker di level API Gateway.  

### Struktur Direktori Kode  

```
ai‑swadaya/
├── docs/                     # Dokumentasi (Markdown)
├── src/
│   ├── inference/            # Kode Inference Engine
│   │   ├── api.py
│   │   ├── models.py
│   │   └── utils.py
│   ├── knowledge/            # Kode Knowledge Base
│   │   ├── indexer.py
│   │   ├── retrieval.py
│   │   └── graph.py
│   ├── learning/             # Kode Learning Loop
│   │   ├── train.py
│   │   ├── reward.py
│   │   └── ray_trainer.py
│   ├── safety/               # Kode Safety & Compliance
│   │   ├── checker.py
│   │   └── audit.py
│   ├── resource_manager/    # Kode Resource Manager
│   │   ├── manager.go
│   │   └── autoscaler.go
│   ├── feedback/             # Kode Feedback Collector
│   │   ├── collector.py
│   │   └── kafka_prod.py
│   ├── external/             # Kode External Integrator
│   │   ├── client.py
│   │   └── auth.py
│   └── main.py              # Entry point & API Gateway
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── docker/
│   ├── Dockerfile.inference
│   ├── Dockerfile.knowledge
│   └── docker‑compose.yml
├── kubernetes/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── hpa.yaml
├── config/
│   ├── config.yaml           # Konfigurasi umum
│   └── .env.sample           # Template environment variable
├── Makefile
├── requirements.txt
└── README.md
```

### Konfigurasi & Environment Variables  

| Variable | Deskripsi | Contoh Nilai |
|----------|-----------|--------------|
| `INFERENCE_MODEL_PATH` | Path ke model ONNX / checkpoint | `/models/llama‑7b` |
| `ELASTICSEARCH_URL` | URL Elasticsearch untuk knowledge base | `http://es:9200` |
| `NEO4J_URI` | URI database graph Neo4j | `bolt://neo4j:7687` |
| `KAFKA_BOOTSTRAP_SERVERS` | Server bootstrap Kafka | `kafka:9092` |
| `OAUTH2_CLIENT_ID` | Client ID untuk OAuth2 external services | `ai-swadaya-client` |
| `OAUTH2_CLIENT_SECRET` | Secret OAuth2 | `***` |
| `GPU_QUOTA_PER_TENANT` | Quota GPU maksimum per tenant (fraction) | `0.5` |
| `LOG_LEVEL` | Level logging | `INFO` |
| `PROMETHEUS_PORT` | Port untuk exposing metrics | `9090` |
| `SENTRY_DSN` | DSN Sentry untuk error tracking | `https://example@sentry.io/...` |

> **Catatan:** Semua variabel dapat di‑overload melalui file `.env` yang di‑load oleh `python-dotenv` pada service Python atau via Kubernetes Secret untuk service Go.

### Alur Kerja (Workflow)  

1. **Permintaan Masuk** → API Gateway (FastAPI)  
   - Autentikasi & rate limiting.
2. **Safety Pre‑Check** → modul Safety (regex / model‑based).  
   - Jika tidak lulus → reject dengan error 400.  
3. **Inference** → Inference Engine  
   - Retrievaloptional (Knowledge Base) jika diperlukan.  
   - Mengembalikan teks hasil.  
4. **Safety Post‑Check** → modul Safety  
   - Jika konten tidak aman → replace / mask.  
5. **Logging & Metrics** → Resource Manager mencatat latensi, usage.  
6. **Feedback Capture** → Feedback Collector mencatat interaksi.  
7. **Learning Loop (async)** → Secara periodik meng‑fine‑tune model berdasarkan feedback.  

### Contoh Penggunaan API  

#### 1. Inferensi  
```bash
curl -X POST https://api.ai-swadaya.io/api/v1/infer \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Jelaskan prinsip kerja motor induksi.",
    "model": "llama-7b",
    "max_tokens": 150,
    "temperature": 0.7
  }'
```

**Response:**  
```json
{
  "text": "Motor induksi bekerja berdasarkan ... (teks hasil generasi).",
  "tokens_used": 132,
  "latency_ms": 245
}
```

#### 2. Pengetahuan (Knowledge Retrieval)  
```bash
curl "https://api.ai-swadaya.io/api/v1/knowledge?q=prinsip+motor+induksi" \
  -H "Authorization: Bearer <token>"
```

**Response:**  
```json
{
  "results": [
    {
      "title": "Motor Induksi – Wikipedia",
      "score": 0.98,
      "excerpt": "Motor induksi adalah motor listrik..."
    }
  ]
}
```

#### 3. Feedback  
```bash
curl -X POST https://api.ai-swadaya.io/api/v1/feedback \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "interaction_id": "abc123",
    "rating": 4,
    "comment": "Jawaban cukup membantu."
  }'
```

### Deployment  

1. **Build Images**  
   ```bash
   make docker-build
   ```  
2. **Push ke Registry**  
   ```bash
   make docker-push REGISTRY=ghcr.io/ai-swadaya
   ```  
3. **Deploy ke Kubernetes**  
   ```bash
   kubectl apply -f kubernetes/deployment.yaml
   kubectl apply -f kubernetes/service.yaml
   kubectl apply -f kubernetes/hpa.yaml
   ```  
4. **Monitor**  
   - Dashboard Grafana untuk metrics GPU & latensi.  
   - Kibana untuk log audit safety.  
   - Alertmanager untuk notifikasi jika latency > 500 ms atau GPU utilization < 20 % (under‑utilized).  

### Keamanan & Compliance  

- **Enkripsi Transit:** Semua traffic internal dan eksternal menggunakan TLS 1.3.  
- **Enkripsi Data-at‑Rest:** Elasticsearch, Neo4j, dan object storage di‑enkripsi menggunakan AES‑256.  
- **Audit Trail:** Setiap request dan keputusan safety di‑log


<think>The user wants me to create the "Pengujian & Validasi" (Testing & Validation) section for their README.md file. Based on the existing content, this is for an AI Swadaya system that appears to be a safety-focused AI system with GPU monitoring, latency alerts, Elasticsearch, Neo4j, etc.

I need to write comprehensive content that:
1. Covers unit testing, integration testing, and performance benchmarking
2. Fits the style and technical level of the existing README
3. Uses proper Markdown formatting
4. Is detailed enough to be useful

Let me create a thorough section that covers:
- Unit testing approach
- Integration testing approach
- Performance benchmarking
- Safety validation testing
- Continuous testing in CI/CD
- Test coverage requirements
- Performance metrics and thresholds
- Load testing considerations
</think>

# Pengujian & Validasi

Bagian ini menjelaskan strategi pengujian menyeluruh untuk sistem AI Swadaya, mencakup unit test, integrasi, benchmark performa, serta validasi safety.

---

## 1. Strategi Pengujian

### 1.1 Pendekatan Pengujian Berlapis

```
┌─────────────────────────────────────────────────────────────┐
│                    Testing Pyramid                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│                         ▲                                    │
│                        /█\        E2E Tests                  │
│                       / █ \       (End-to-End Scenarios)    │
│                      /  █  \      ~10% total testing        │
│                     /────█────\                              │
│                    /     █     \     Integration Tests       │
│                   /      █      \    (API, Database, GPU)   │
│                  /───────█───────\   ~30% total testing      │
│                 /        █        \                          │
│                /─────────█─────────\   Unit Tests            │
│               /          █          \  (Component, Module)   │
│              /────────────────────────\ ~60% total testing  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 1.2 Prinsip Pengujian

| Prinsip | Deskripsi | Penerapan |
|---------|-----------|-----------|
| **Isolasi** | Setiap test berdiri sendiri tanpa dependensi eksternal | Mocking services eksternal |
| **Repeatability** | Hasil test konsisten setiap eksekusi | Environment terkontrol dalam container |
| **Atomicity** | Setiap test hanya menguji satu aspek | Satu assertion per test case |
| **Fast Feedback** | Deteksi bug secepat mungkin | Unit test < 5 detik per modul |

---

## 2. Unit Testing

### 2.1 Struktur Pengujian

```
tests/
├── unit/
│   ├── safety/
│   │   ├── test_content_filter.py
│   │   ├── test_intent_classifier.py
│   │   ├── test_response_validator.py
│   │   └── conftest.py
│   ├── core/
│   │   ├── test_tokenizer.py
│   │   ├── test_embedding.py
│   │   └── test_cache_manager.py
│   └── utils/
│       ├── test_logger.py
│       └── test_config_loader.py
```

### 2.2 Contoh Test Cases - Content Filter

```python
# tests/unit/safety/test_content_filter.py
import pytest
from src.safety.content_filter import ContentFilter

class TestContentFilter:
    """Test suite untuk Content Filter module."""
    
    @pytest.fixture
    def filter_instance(self):
        """Setup instance ContentFilter."""
        return ContentFilter(
            model_path="models/safety-filter-v2",
            confidence_threshold=0.85
        )
    
    @pytest.mark.parametrize("input_text,expected_risk", [
        # Skenario: Teks Aman
        ("Apa kabar?", "low"),
        ("Jelaskan fotosintesis", "low"),
        ("Cara memasak nasi", "low"),
        
        # Skenario: Teks dengan Risiko Sedang
        ("Bagaimana membuat bom", "high"),  # Intent berbahaya
        ("Tutorial hacking", "high"),
        
        # Skenario: Boundary Testing
        ("", "low"),           # Empty input
        ("a" * 10000, "low"), # Very long input
        ("🚗🔫💣", "low"),    # Emoji only
    ])
    def test_risk_classification(self, filter_instance, input_text, expected_risk):
        """Test klasifikasi risiko berbagai jenis input."""
        result = filter_instance.classify(input_text)
        
        assert result["risk_level"] == expected_risk
        assert "confidence_score" in result
        assert 0 <= result["confidence_score"] <= 1
    
    def test_latency_requirement(self, filter_instance):
        """Test bahwa latensi filtering < 50ms untuk input normal."""
        import time
        
        test_input = "Ini adalah teks pengujian dengan panjang sedang untuk memastikan performa."
        start = time.time()
        filter_instance.classify(test_input)
        latency_ms = (time.time() - start) * 1000
        
        assert latency_ms < 50, f"Latensi {latency_ms:.2f}ms melebihi threshold 50ms"
    
    def test_audit_log_generation(self, filter_instance):
        """Test bahwa setiap evaluasi menghasilkan audit log."""
        result = filter_instance.classify("Test input")
        
        assert result["audit_id"] is not None
        assert result["timestamp"] is not None
        assert "model_version" in result
```

### 2.3 Coverage Requirements

| Modul | Minimum Coverage | Critical Paths |
|-------|------------------|----------------|
| `safety/` | 90% | Content filtering, intent classification |
| `core/` | 85% | Tokenizer, embedding generation |
| `api/` | 80% | Request validation, error handling |
| `utils/` | 95% | Logging, configuration |

---

## 3. Integration Testing

### 3.1 Test Environment Setup

```yaml
# docker-compose.test.yml
version: '3.8'

services:
  # Test environment menggunakan container 
  # dengan resource terbatas untuk simulasi
  
  api-gateway-test:
    build: .
    command: pytest tests/integration/
    environment:
      - ENV=test
      - NEO4J_URI=bolt://neo4j-test:7687
      - ES_URI=http://elasticsearch-test:9200
    depends_on:
      - neo4j-test
      - elasticsearch-test
      - redis-test
    volumes:
      - ./tests:/app/tests
      - ./coverage:/app/coverage
    deploy:
      resources:
        limits:
          memory: 512M
          cpus: '0.5'
        reservations:
          memory: 256M
          cpus: '0.25'

  neo4j-test:
    image: neo4j:5.12-community
    environment:
      - NEO4J_AUTH=none
    ports:
      - "7474:7474"
      - "7687:7687"

  elasticsearch-test:
    image: elasticsearch:8.11.0
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
    ports:
      - "9200:9200"

  redis-test:
    image: redis:7-alpine
    ports:
      - "6379:6379"
```

### 3.2 Integration Test Cases

#### 3.2.1 End-to-End Request Flow

```python
# tests/integration/test_request_flow.py
import pytest
import httpx
import asyncio

class TestRequestFlow:
    """Integration test untuk alur request lengkap."""
    
    @pytest.fixture
    def api_base_url(self):
        """Setup base URL untuk API test."""
        return "http://api-gateway-test:8000"
    
    @pytest.mark.asyncio
    async def test_complete_request_lifecycle(self, api_base_url):
        """
        Test alur lengkap:
        1. User mengirim request
        2. Request masuk Content Filter
        3. Intent classification
        4. Response generation (mocked)
        5. Safety validation
        6. Audit log ke Elasticsearch
        7. Graph update ke Neo4j
        """
        async with httpx.AsyncClient(timeout=30.0) as client:
            # Step 1: Submit request
            request_payload = {
                "user_id": "test-user-001",
                "session_id": "session-xyz",
                "input": {
                    "type": "text",
                    "content": "Jelaskan teori relativitas Einstein"
                },
                "metadata": {
                    "client_version": "2.1.0",
                    "platform": "web"
                }
            }
            
            response = await client.post(
                f"{api_base_url}/v1/chat/completions",
                json=request_payload
            )
            
            # Validate response
            assert response.status_code == 200
            data = response.json()
            
            assert "request_id" in data
            assert "response" in data
            assert "safety_score" in data
            assert data["safety_score"] >= 0.8
            
            # Verify audit log exists
            audit_response = await client.get(
                f"{api_base_url}/v1/audit/{data['request_id']}"
            )
            assert audit_response.status_code == 200
            
            # Verify graph node created
            graph_response = await client.get(
                f"{api_base_url}/v1/graph/interactions",
                params={"user_id": "test-user-001"}
            )
            assert graph_response.status_code == 200
    
    @pytest.mark.asyncio
    async def test_concurrent_requests_handling(self, api_base_url):
        """Test sistem menangani request konkuren dengan baik."""
        num_requests = 50
        
        async def send_request(idx):
            async with httpx.AsyncClient(timeout=30.0) as client:
                return await client.post(
                    f"{api_base_url}/v1/chat/completions",
                    json={
                        "user_id": f"user-{idx}",
                        "input": {"type": "text", "content": f"Request {idx}"}
                    }
                )
        
        # Execute concurrent requests
        tasks = [send_request(i) for i in range(num_requests)]
        responses = await asyncio.gather(*tasks)
        
        # Validate all succeeded
        success_count = sum(1 for r in responses if r.status_code == 200)
        assert success_count == num_requests, \
            f"Hanya {success_count}/{num_requests} request berhasil"
```

#### 3.2.2 Database Integration Tests

```python
# tests/integration/test_database_integration.py
import pytest
from neo4j import GraphDatabase
from elasticsearch import Elasticsearch

class TestDatabaseIntegration:
    """Integration tests untuk Neo4j dan Elasticsearch."""
    
    @pytest.fixture(scope="class")
    def neo4j_driver(self):
        """Setup Neo4j driver untuk test."""
        driver = GraphDatabase.driver(
            "bolt://neo4j-test:7687",
            auth=None
        )
        yield driver
        driver.close()
    
    @pytest.fixture(scope="class") 
    def es_client(self):
        """Setup Elasticsearch client untuk test."""
        client = Elasticsearch(["http://elasticsearch-test:9200"])
        yield client
        client.close()
    
    def test_neo4j_knowledge_graph_operations(self, neo4j_driver):
        """Test operasi CRUD pada knowledge graph."""
        with neo4j_driver.session() as session:
            # Create test node
            result = session.run("""
                CREATE (u:User {id: $user_id, name: $name})
                RETURN u.id as id
            """, user_id="test-123", name="Test User")
            assert result.single()["id"] == "test-123"
            
            # Read
            result = session.run(
                "MATCH (u:User {id: $id}) RETURN u.name",
                id="test-123"
            )
            assert result.single()["name"] == "Test User"
            
            # Update
            session.run("""
                MATCH (u:User {id: $id})
                SET u.name = $new_name
            """, id="test-123", new_name="Updated Name")
            
            # Delete
            session.run("MATCH (u:User {id: $id}) DELETE u", id="test-123")
            
            # Verify deletion
            result = session.run(
                "MATCH (u:User {id: $id}) RETURN count(u) as count",
                id="test-123"
            )
            assert result.single()["count"] == 0
    
    def test_elasticsearch_audit_logging(self, es_client):
        """Test audit log indexing dan search."""
        # Index audit log
        doc = {
            "request_id": "test-req-001",
            "user_id": "test-user",
            "action": "safety_check",
            "timestamp": "2024-01-15T10:30:00Z",
            "result": "passed"
        }
        
        es_client.index(index="audit-logs", id="test-req-001", document=doc)
        es_client.indices.refresh(index="audit-logs")
        
        # Search
        response = es_client.search(
            index="audit-logs",
            body={
                "query": {
                    "term": {"request_id": "test-req-001"}
                }
            }
        )
        
        assert response["hits"]["total"]["value"] == 1
        assert response["hits"]["hits"][0]["_source"]["action"] == "safety_check"
```

---

## 4. Performance Benchmarking

### 4.1 Benchmark Framework

```python
# benchmarks/run_benchmark.py
import asyncio
import time
import statistics
from typing import List, Dict
from dataclasses import dataclass
import httpx

@dataclass
class BenchmarkResult:
    """Struktur data untuk hasil benchmark."""
    metric_name: str
    min: float
    max: float
    mean: float
    median: float
    p95: float
    p99: float
    unit: str

class PerformanceBenchmark:
    """Framework untuk benchmark performa sistem."""
    
    def __init__(self, api_base_url: str):
        self.api_base_url = api_base_url
        self.results: List[BenchmarkResult] = []
    
    async def benchmark_latency(self, num_requests: int
