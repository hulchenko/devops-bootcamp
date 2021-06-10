//shorcut: <ipaddress:8080/script>
// Documentation: http://www.groovy-lang.org/documentation.html

println("Hello World!") //printLn <<
new File('/etc/passwd').text
"ls -la /etc/".execute().text
new File("${Jenkins.instance.root}") //Result: /var/lib/jenkins

Jenkins.instance.setNumExecutors(5) //sets 5 executors (to execute at the same time if needed)

job = Jenkins.instance.getItemByFullName("BuildAutoTrigger4")
job.getBuilds().each {
  println("Build " + it + " Results " + it.result) //it for i (index)
}
//Result:
// Build BuildAutoTrigger4 #3 Results SUCCESS
// Build BuildAutoTrigger4 #2 Results SUCCESS
// Build BuildAutoTrigger4 #1 Results SUCCESS
// Result: [BuildAutoTrigger4 #3, BuildAutoTrigger4 #2, BuildAutoTrigger4 #1]

job = Jenkins.instance.getItemByFullName("BuildAutoTrigger1")
job.getBuilds().each {
  if(it.result == Result.FAILURE){
    it.delete()
  }
}
//to remove all failure results in the BuildAutoTrigger1 job

job = Jenkins.instance.getItemByFullName("BuildAutoTrigger1")
job.getBuilds().each { build ->
    build.delete()
    //deletes all of the results in the job
}
job.updateNextBuildNumber(1) //resets job counter back to 1