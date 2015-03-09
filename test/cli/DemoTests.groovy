import grails.test.AbstractCliTestCase

class DemoTests extends AbstractCliTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testDemo() {

        execute(["demo"])

        assertEquals 0, waitForProcess()
        verifyHeader()
    }
}
