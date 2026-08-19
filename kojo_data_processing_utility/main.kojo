// =============================================================================
// Kojo Data Processing Utility
// Language: Kojo (Scala-based)
// =============================================================================

// Global State for Pipeline Progress
class PipelineStatus {
  var stepsCompleted: Int = 0
  var totalSteps: Int = 0
  var statusMessage: String = "Idle"
  
  def startPipeline(): Unit = {
    totalSteps = 4 // Ingest, Validate, Transform, Report
    stepsCompleted = 0
  }
  
  def stepComplete(message: String): Unit = {
    stepsCompleted += 1
    statusMessage = message
    if (stepsCompleted < totalSteps) {
      println(s"Step ${stepsCompleted}: ${message}")
    }
  }
  
  def isFinished(): Boolean = stepsCompleted >= totalSteps
}

// Data Models
abstract class DataRecord {
  def isValid: Boolean
  def toPrettyString: String
}

class StudentRecord(
  val id: Int,
  val name: String,
  val score: Double,
  val major: String
) extends DataRecord {
  override def isValid: Boolean = {
    id > 0 && !name.isEmpty && score >= 0 && score <= 100 && !major.isEmpty
  }
  
  override def toPrettyString: String = {
    s"ID: $id, Name: $name, Score: $score, Major: $major"
  }
}

// Utility for Ingestion
object IngestionEngine {
  // Simulates reading from a file or API by providing raw string data
  def parseRawData(rawData: String): List[StudentRecord] = {
    val lines = rawData.split("\\n").filter(_.trim.nonEmpty)
    
    lines.map { line =>
      val parts = line.split(",")
      if (parts.length >= 4) {
        try {
          val id = parts(0).trim.toInt
          val name = parts(1).trim
          val score = parts(2).trim.toDouble
          val major = parts(3).trim
          new StudentRecord(id, name, score, major)
        } catch {
          case _: NumberFormatException => 
            // Return invalid record with default/empty values to be caught by validator
            new StudentRecord(-1, "Invalid", -1.0, "") 
        }
      } else {
        new StudentRecord(-1, "Invalid", -1.0, "")
      }
    }.toList
  }
  
  def loadSampleData(): String = {
    """1, Alice Johnson, 95.5, Computer Science
2, Bob Smith, 82.0, Mathematics
3, Charlie Brown, 76.3, Physics
4, Diana Prince, 99.1, Computer Science
5, Eve Davis, 45.2, Biology
6, Frank Miller, -5.0, Chemistry
7, Grace Lee, 88.9, Mathematics
8, Hank Green, 91.0,
9, Invalid Line Missing Data
10, Ivy Chen, 72.4, Physics"""
  }
}

// Utility for Validation
object ValidationEngine {
  def validateRecords(records: List[StudentRecord]): (List[StudentRecord], List[String]) = {
    var validRecords = ListBuffer[StudentRecord]()
    var errorLogs = ListBuffer[String]()
    var index = 1
    
    records.foreach { record =>
      if (record.isValid) {
        validRecords += record
      } else {
        errorLogs += s"[ERROR] Line $index: Invalid Data - ${record.toPrettyString}"
      }
      index += 1
    }
    
    (validRecords.toList, errorLogs.toList)
  }
}

// Utility for Transformation
object TransformationEngine {
  case class GradedStudent(student: StudentRecord, grade: Char, remark: String)
  
  def applyGrading(records: List[StudentRecord]): List[GradedStudent] = {
    records.map { student =>
      val grade = student.score match {
        case s if s >= 90 => 'A'
        case s if s >= 80 => 'B'
        case s if s >= 70 => 'C'
        case s if s >= 60 => 'D'
        case _            => 'F'
      }
      
      val remark = if (student.score >= 70) "Pass" else "Fail"
      
      GradedStudent(student, grade, remark)
    }
  }
  
  def calculateStats(records: List[GradedStudent]): Map[String, Double] = {
    if (records.isEmpty) return Map.empty[String, Double]
    
    val scores = records.map(_.student.score)
    val avg = scores.sum / scores.length
    val max = scores.max
    val min = scores.min
    
    Map(
      "average" -> avg,
      "maximum" -> max,
      "minimum" -> min,
      "count" -> records.length.toDouble
    )
  }
  
  def filterTopPerformers(records: List[GradedStudent], threshold: Char = 'B'): List[GradedStudent] = {
    val validGrades = List('A', 'B')
    records.filter(r => validGrades.contains(r.grade))
  }
}

// Utility for Reporting
object ReportingEngine {
  def generateReport(
    originalCount: Int,
    validCount: Int,
    errorCount: Int,
    stats: Map[String, Double],
    topPerformers: List[TransformationEngine.GradedStudent]
  ): String = {
    val header = "=" * 50
    val body = {
      s"""
       |Data Processing Report
       |$header
       |Summary:
       |  Total Records Ingested : $originalCount
       |  Valid Records          : $validCount
       |  Invalid Records        : $errorCount
       |  Pass Rate              : ${(validCount.toDouble / originalCount * 100).formatted("%.2f")}%
       |$header
       |Statistics:
       |  Average Score          : ${stats("average").formatted("%.2f")}
       |  Maximum Score          : ${stats("maximum").formatted("%.2f")}
       |  Minimum Score          : ${stats("minimum").formatted("%.2f")}
       |  Top Performers Count   : ${stats("count").formatted("%.0f")}
       |$header
       |Top Performers (Grade A/B):
       |${topPerformers.map(p => f"  ${p.student.name}%-20s ${p.student.score}%.1f %c" + "\n").mkString}
       |$header
       |""".stripMargin
    }
    
    header + "\n" + body
  }
  
  def logErrors(errorLogs: List[String]): Unit = {
    if (errorLogs.nonEmpty) {
      println("\\n--- Validation Errors ---")
      errorLogs.foreach(println)
      println("-------------------------\\n")
    } else {
      println("\\n--- No Validation Errors ---\\n")
    }
  }
}

// Main Orchestrator
object Main {
  def run(): Unit = {
    val status = new PipelineStatus
    status.startPipeline()
    
    // 1. Ingestion
    println("Starting Data Processing Pipeline...")
    println("Step 1: Ingesting Data...")
    val rawInput = IngestionEngine.loadSampleData()
    val rawRecords = IngestionEngine.parseRawData(rawInput)
    println(s"Ingested ${rawRecords.length} raw records.")
    status.stepComplete("Data Ingestion Complete")
    
    // 2. Validation
    println("Step 2: Validating Data...")
    val (validRecords, errorLogs) = ValidationEngine.validateRecords(rawRecords)
    println(s"Validation complete: ${validRecords.length} valid, ${errorLogs.length} invalid.")
    ReportingEngine.logErrors(errorLogs)
    status.stepComplete("Data Validation Complete")
    
    // 3. Transformation
    println("Step 3: Transforming Data...")
    val gradedRecords = TransformationEngine.applyGrading(validRecords)
    val stats = TransformationEngine.calculateStats(gradedRecords)
    val topPerformers = TransformationEngine.filterTopPerformers(gradedRecords)
    println(s"Transformation complete: ${gradedRecords.length} records processed.")
    status.stepComplete("Data Transformation Complete")
    
    // 4. Reporting
    println("Step 4: Generating Report...")
    val report = ReportingEngine.generateReport(
      originalCount = rawRecords.length,
      validCount = validRecords.length,
      errorCount = errorLogs.length,
      stats = stats,
      topPerformers = topPerformers
    )
    println(report)
    status.stepComplete("Report Generation Complete")
    
    println("Pipeline finished successfully.")
  }
}

// Entry Point
Main.run()
