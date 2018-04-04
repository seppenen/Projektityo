<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

if(session.getAttribute("session")==null){

response.sendRedirect("index.jsp");
}
%>
    <%@ page import="model.User"%>  
<%@ page import="java.util.ArrayList"%> 
    <%@ page import="model.Order"%>
    <%! @SuppressWarnings("unchecked") %>
    
    <% String id= request.getParameter("id");
    
    
    
  
    	
%>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>Dashboard</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
   
    <link href="dashboard.css" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-dark bg-dark p-0">
      <div class="navbar-brand col-sm-3 bg-dark col-md-2 mr-0" >Logo</div>
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Sign out</a>
        </li>
      </ul>
    </nav>

    <div class="container-fluid ">
      <div class="row ">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column ">
              <li class="nav-item ">
                <a class="nav-link " href="#">
                  <span data-feather="home"></span>
                  Dashboard 
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="calendar"></span>
                  Calendar
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="box"></span>
                  Services
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="users"></span>
                  Customers
                </a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="shopping-cart"></span>
                  Companies
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="settings"></span>
                  Settings
                </a>
              </li>
             
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Reports</span>
             
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" value="1" href="#">
                  <span data-feather="file-text"></span>
                  Current day
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="7" value="7" href="#">
                  <span data-feather="file-text"></span>
                  Last week
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" value="30" href="#">
                  <span data-feather="file-text"></span>
                  Last month
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" value="90" href="#">
                  <span data-feather="file-text"></span>
                  Last quarter
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Dashboard</h1>
           
          </div>

          <canvas class="my-4" id="myChart" width="900" height="380"></canvas>

         
          <table class="table table-sm table-hover mt-4 orders">
 		<div class="col-md-12 mt-2 table-top"><h2>Latest Activity</h2></div>
          <thead class="thead-dark">

    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Date</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
<%

if( request.getAttribute("tilaukset")!=null){
	ArrayList <Order> order = (ArrayList<Order>)request.getAttribute("tilaukset");	

	for(int i=0;i<order.size();i++){
		out.print("\n<tr>");
		out.print("<th scope='row'>" + order.get(i).getId()+"</th>");
		out.print("<td>" + order.get(i).getTitle()+"</td>");
		out.print("<td>" + order.get(i).getStart()+"</td>");
		out.print("<td>" + order.get(i).getStatus()+"</td>");
		out.print("<td> View Complete </td>");
		out.print("</tr>");
			}	

}
 %>




</tbody>
		</table>
  </div>
        </main>
      </div>

    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
    <script>
    var a=$.Deferred();
    var b=$.Deferred();
    
    var timeFormat = 'YYYY-MM-DD';
    var timeFormat2 = 'DD MMM';
    var labels= []; 
    var chartlabels= [];// Dates
    var parsedData=[];
    var userServices=[];
    var newDataset;
    
    $( document ).ready(function() {
    	
  	  if(labels[0]==null){
  			console.log("newDate");
  		labelFunction(30);

  	}
  	    	     
  });
    
    function labelFunction(num){
  	  console.log("labelFunction");
  	 	 labels.length = 0;
  	 	chartlabels.length = 0;
  		 	for (i=0; i<num;i++){
  	      	labels.push(newDate(0-i, timeFormat));
  	      chartlabels.push(newDate(0-i, timeFormat2));
  	      	
  	      	}
  		 	b.resolve();
  		 //	labels.reverse();
  	      	myChart.update();
  	      	 
        	 
  		}
    
    
    var  config = {
	      	  type: 'bar',
	            beginAtZero: false,

	      	    
	      	  data: {
	      	    datasets: [],
	      	    labels: chartlabels,
	      	  },     
	          options: {
	          	scales: {
	  				xAxes: [{
	  		
	  				}],
	  				yAxes: [{
	  					ticks: {
	  	                    beginAtZero:false
	  	                }
	  				}]
	  			},
	  			legend: {
	  	            display: false,
	  	          },
	          }
	        };
    
    function parseData(data){
    	
	
    	if (parsedData.length>0)
    	{
    		parsedData=[]; 
    		
    	}
    	
    	
        var paikat = JSON.parse(data); 
		var label;
        

         for(var i=0;i<labels.length;i++){
				var q=0;
      	   for(var j=0;j<paikat.length;j++){
      		
                if (paikat[j].start.toString().substring(0, 10)==labels[i]){
                	console.log(paikat[j].start.toString().substring(0, 10));
              	 q++; 
              	 label=paikat[j].title;
              	 
                }
       
                 } 
      	 parsedData[i]=q;
             }
         dataPush(label);

  
         }
    

    function getData(){

    	console.log("getData");
    	
    	for (var i=0; i<userServices.length; i++){
    		
        $.ajax({
                  type: 'GET',
                  url: 'Servlet_tilastoJson?id='+userServices[i],
                		                   
                  success: function(data){
                	  
              		 parseData(data);
           				
                  },
                  error: function(){  
                      console.log(2);                                         
                  }
              });          
    	}
    
  }
    
   
    var ctx = document.getElementById("myChart");
    var myChart = new Chart(ctx, config);
    

     function haeServices(){	
    	
  	 $.ajax({
  		  url: "Servlet_tilauksetJSON",
  		 success: function(result){
  			var jsonData = JSON.parse(result);
		// var data=(Array.from(result));
  		 		  
  				 for(var i=0;i<jsonData.length;i++){
  					userServices[i]=jsonData[i].service_id;
  		  }
		
		a.resolve();
	    }});
	
	
    }
    
     haeServices();
     $.when(a, b).done(getData);
    
	function newDate(days,f) {		
		return moment().add(days, 'd').format(f);	
	}
	   
      function dataPush(label){
  
    	  for (var i=0; i<parsedData.length; i++){
    		  
    		  if(parsedData[i]>0){
    			  	
    	  console.log("dataPush()");
    	
    	   newDataset = {
  				label: label,
  				backgroundColor: 'blue',
  				fill: false,
  				data: parsedData,
  				 // backgroundColor: 'transparent',
  	            borderColor: 'transparent',
  	            borderWidth: 4,
  	            pointBackgroundColor: '#007bff'
  			};

  			config.data.datasets.push(newDataset);
  			myChart.update();
  			
  			 
  			 
  			parsedData=[];
    		  }
    	  }   
    	  
      }
     
    
      
      $(".nav-link").on("click", function() { 
    	  
    	  labelFunction($(this).attr("value"));

      });

      
      
    </script>

  </body>
</html>

