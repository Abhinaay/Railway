<%@page import="org.json.simple.parser.*"%>
<%@page import="java.net.*,java.io.*, java.util.*"%>

<%

  
String source=request.getParameter("source");
String destination=request.getParameter("destination");
String date1=request.getParameter("date1");
String yyyy=date1.substring(0, 4);
String mm=date1.substring(4, 8);
String dd=date1.substring(8, 10);
String d=dd+mm+yyyy;

String mainurl="https://api.railwayapi.com/v2/between/source/"+source+"/dest/"+destination+"/date/"+d+"/apikey/p8onwdgigu/";

				//String mainurl = "https://api.railwayapi.com/v2/between/source/JP/dest/HPU/date/30-06-2019/apikey/p8onwdgigu/";
				
				URL myURL = new URL(mainurl);
				URLConnection myURLConnection = myURL.openConnection();
				myURLConnection.connect();
				BufferedReader reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
				String response1 = "", store = "";
				while ((response1 = reader.readLine()) != null) {
				
					store = store + response1;
				}
				// System.out.println(store);
				
				JSONParser parser = new JSONParser();
				Map jsondata = (Map) parser.parse(store);
				
				ArrayList ft = new ArrayList();
				ft.add(jsondata.get("trains"));
				
				ArrayList ft2 = new ArrayList();
				ft2.addAll((Collection) ft.get(0));
				
				int num = ft2.size(), num2 = 0;
				
				for (int i = 0; i < num; i++)
				{
					Map info = (Map) ft2.get(i);
					System.out.println(info.get("number"));
					System.out.println(info.get("name"));
					System.out.println(info.get("travel_time"));
					System.out.println(info.get("src_departure_time"));
					System.out.println(info.get("dest_arrival_time"));
					// System.out.println(info.get("days"));
				
					ArrayList days = new ArrayList();
					days.addAll((Collection) info.get("days"));
					num2 = days.size();
					out.print("<table border=2>");
					
					
					for (int j = 0; j < num2; j++) 
					{
						
						Map d2 = (Map) days.get(j);
						out.println("</tr>");
						//out.println(d2.get("code"));
						//out.println(d2.get("runs"));
						
						 out.println("<td>"+d2.get("code")+"</td>");
						 out.println("<td> "+d2.get("runs")+"</td>");
						out.println("</tr>");
					}
				out.println("</table>");
					System.out.println("------------------------------");
				}



          /*  URL myURL = new URL(mainurl);
          URLConnection  myURLConnection = myURL.openConnection();
            myURLConnection.connect();
           BufferedReader reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
            String response1="",store="";
			while ((response1 = reader.readLine()) != null)
			{       
				
				store=store+response1;
			}
           
           out.println(store); */

%>
