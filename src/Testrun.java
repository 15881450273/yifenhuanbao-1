import com.nddmwdf.program.test.TestAdmin;
import com.nddmwdf.program.test.TestGarbage;
import com.nddmwdf.program.test.TestNews;
import com.nddmwdf.program.test.TestUser;
import com.sun.net.httpserver.Authenticator;
import org.junit.runner.JUnitCore;
import org.junit.runner.notification.Failure;

import javax.xml.transform.Result;

public class Testrun {
    public static void main(String []args)
    {
        org.junit.runner.Result result=JUnitCore.runClasses(TestAdmin.class);
        for (Failure failure:result.getFailures())
        {
            System.out.println(failure.toString());
        }
        System.out.println(result.wasSuccessful());
    }
}
