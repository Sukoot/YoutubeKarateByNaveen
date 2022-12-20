package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	Karate getAPITest() {

		return Karate.run("getapi1").relativeTo(getClass());
	}
	

	@Karate.Test
	Karate postAPITest() {

		return Karate.run("postapicall").relativeTo(getClass());
	}
	

	@Karate.Test
	Karate putAPITest() {

		return Karate.run("putapicall").relativeTo(getClass());
	}
	

	@Karate.Test
	Karate deleteAPITest() {

		return Karate.run("deleteapi").relativeTo(getClass());
	}
	

	@Karate.Test
	Karate jsonTest() {

		return Karate.run("json1").relativeTo(getClass());
	}
	
	
	
}






