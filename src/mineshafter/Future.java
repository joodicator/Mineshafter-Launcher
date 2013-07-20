/*******************************************************************************
 *  mineshafter.Future - functionality from Java's standard library that is not
 *  available in old versions of Java.
 */

package mineshafter;

import java.net.InetAddress;
import java.net.Inet4Address;

public class Future {

    public static InetAddress getLoopbackAddress ()
    throws java.net.UnknownHostException {
        return InetAddress.getByAddress(new byte[] {127,0,0,1});
    }

}
