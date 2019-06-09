<%@page import="java.net.*,java.io.*,java.time.*"%>
<%

  

String train_number=request.getParameter("train-number");
String station_code=request.getParameter("station-code");

  
LocalDate date = LocalDate.now();  
String date1=date.toString();
String yyyy=date1.substring(0, 4);
String mm=date1.substring(4, 8);
String dd=date1.substring(8, 10);
String d=dd+mm+yyyy;

String mainurl="https://api.railwayapi.com/v2/live/train/"+train_number+"/station/"+station_code+"/date/"+d+"/apikey/p8onwdgigu/";



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
