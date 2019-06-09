<%@page import="java.net.*,java.io.*"%>
<%


String train_number=request.getParameter("train-number");
String source=request.getParameter("source");
String destination=request.getParameter("destination");
String date1=request.getParameter("date");
String yyyy=date1.substring(0, 4);
String mm=date1.substring(4, 8);
String dd=date1.substring(8, 10);
String d=dd+mm+yyyy;
String quota=request.getParameter("quota");
String pref=request.getParameter("pref");
String age=request.getParameter("age");


String mainurl="https://api.railwayapi.com/v2/fare/train/"+train_number+"/source/"+source+"/dest/"+destination+"/age/"+age+"/pref/"+pref+"/quota/"+quota+"/date/"+d+"/apikey/p8onwdgigu/";



           URL myURL = new URL(mainurl);
          URLConnection  myURLConnection = myURL.openConnection();
            myURLConnection.connect();
           BufferedReader reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
            String response1="",store="";
			while ((response1 = reader.readLine()) != null)
			{       
				//System.out.println(response1);
				store=store+response1;
			}
           // reader.close();
           out.println(store);

%>
