name := "scala_federated_incident_coordinator"

version := "1.0"

scalaVersion := "2.13.8"

libraryDependencies ++= Seq(
  "com.typesafe.akka" %% "akka-actor" % "2.6.19",
  "com.typesafe.akka" %% "akka-stream" % "2.6.19",
  "com.typesafe.akka" %% "akka-remote" % "2.6.19",
  "com.typesafe" % "config" % "1.4.1"
)
