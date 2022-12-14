Class MyApp.TestUtil Extends %RegisteredObject
{

ClassMethod RunTest()
{
#define AppTestPackageName "MyApp"
	;Set tSC=##class(TestCoverage.Manager).RunTest($$$AppTestPackageName,"/nodelete")
	Set tSC=##class(%UnitTest.Manager).RunTest($$$AppTestPackageName,"/nodelete")
	Do ##class(%ZPM.PackageManager.Developer.UnitTest.JUnitOutput).ToFile("/home/irisowner/result.xml")

	Set lastid=$G(^UnitTest.Result)
	If ..getLastTestResult(lastid)=$$$OK {
		Do $SYSTEM.Process.Terminate(,0)
	}
	Else {
		#; Return fail(1) as an exit status to shell
		Do $SYSTEM.Process.Terminate(,1)
	}
}

ClassMethod getLastTestResult(id) As %Boolean
{
 	Set in = ##class(%UnitTest.Result.TestSuite).%OpenId(id_"||"_$$$AppTestPackageName)
  	Return in.Status
}

}
