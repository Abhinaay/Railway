<%@page import="java.net.*,java.io.*"%>
<%

String train_number=request.getParameter("train-number");

String mainurl="https://api.railwayapi.com/v2/route/train/"+train_number+"/apikey/p8onwdgigu/";



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
