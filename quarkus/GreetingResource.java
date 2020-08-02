package org.acme.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
//import com.dynatrace.oneagent.sdk.api.*;
import com.dynatrace.oneagent.sdk.OneAgentSDKFactory;
import com.dynatrace.oneagent.sdk.api.IncomingWebRequestTracer;
import com.dynatrace.oneagent.sdk.api.OneAgentSDK;
import com.dynatrace.oneagent.sdk.api.infos.WebApplicationInfo;
@Path("/greeting")
public class GreetingResource {
    private final OneAgentSDK oneAgentSDK=null;
    private  WebApplicationInfo webAppInfo;
    @GET
    @Produces(MediaType.TEXT_PLAIN)



    public String hello() {
         String url="/";
         OneAgentSDK oneAgentSDK = OneAgentSDKFactory.createInstance();
         webAppInfo = oneAgentSDK.createWebApplicationInfo("servername", "BillingService", "/billing");
         IncomingWebRequestTracer incomingWebrequestTracer = oneAgentSDK.traceIncomingWebRequest(webAppInfo, url, "GET");
         return "hello";
    }
}
