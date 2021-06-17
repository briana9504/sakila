<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
    <!-- Summernote -->
    <link href="${pageContext.request.contextPath}/vendor/summernote/summernote.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<style>
	table {
    margin-left:auto;
    margin-right:auto;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- 
	<script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.bundle.min.js"></script>
	
	<script src="./vendor/chart.js/Chart.bundle.min.js"></script>
    <script src="./js/plugins-init/chartjs-init.js"></script>
 -->
<script>
$(document).ready(function(){
	
	//월별 매출 막대 그래프 방법
	//달별 매출액 그리기 위한 자료
	function monthss(){
		$.ajax({
		type: 'get',
		url: '/getSalesByMonth',
		data: {year : $('#yearByMonthSales').val()},
		success: function(jsonData){
			//console.log('성공');
			//console.log(jsonData);
			
			//let roots = numbers.map((num) => Math.sqrt(num))
			let store1 =  jsonData.filter(item => item.storeId ==1);
			let store2 = jsonData.filter(item => item.storeId ==2);
			
			console.log(store1);
			
			let storeCount1 = store1.map(item => item.amount);
			let storeCount2 = store2.map(item => item.amount);
			//console.log(storeCount1);
			//let res = users.filter(it => it.name.includes('oli'))
			let date = store1.map(item => item.date);
			console.log(date);
			

			
			const labels = date;
			const data = {
			  labels: labels,
			  datasets: [
			    {
			      label: 'store 1',
			      data: storeCount1,
			      backgroundColor: 'rgb(255, 99, 132)',
			    },
			    {
			      label: 'store 2',
			      data: storeCount2,
			      backgroundColor: 'rgb(54, 162, 235)',
			    }
			  ]
			};
						
			
			const config = {
					  type: 'bar',
					  data: data,
					  options: {
					    plugins: {
					      title: {
					        display: false,
					        text: 'Chart.js Bar Chart - Stacked'
					      },
					    },
					    responsive: true,
					    scales: {
					      x: {
					        stacked:  true,
					      },
					      y: {
					        stacked: true
					      }
					    }
					  }
					};
				
				
				var myChart = new Chart(		
					    document.getElementById('myChart2'),
					    config
					  );
			
				//const DATA_COUNT = 7;
				//const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};

		}
	});
	}
	
	
	//일별 매출애 그리기 위한 자료
	function days(){ $.ajax({
		type: 'get',
		url: '/getSalesByDay',
		data: {year : $('#yearByDaysSales').val(), month: $('#monthByDaysSales').val()},
		success: function(jsonData){
			//console.log('성공');
			console.log(jsonData);
			
			let store1 =  jsonData.filter(item => item.storeId ==1);
			let store2 = jsonData.filter(item => item.storeId ==2);
			
			console.log(store1);
			console.log(store2);
			
			let storeCount1 = store1.map(item => item.amount);
			let storeCount2 = store2.map(item => item.amount);
			console.log(storeCount1);
			//let res = users.filter(it => it.name.includes('oli'))
			let day = store1.map(item => item.day);
			console.log(day);
			
			const labels = day;
			const data = {
			  labels: labels,
			  datasets: [
			    {
			      label: 'store 1',
			      data: storeCount1,
			      borderColor: 'rgb(243,145,166)',
			      backgroundColor: 'rgb(243,140,166)',
			    },
			    {
			      label: 'store 2',
			      data: storeCount2,
			      borderColor: 'rgb(25,25,112)',
			      backgroundColor: 'rgb(120,120, 200)',
			    }
			  ]
			};
				const config = {
				  type: 'line',
				  data: data,
				  options: {
				    responsive: true,
				    plugins: {
				      legend: {
				        position: 'top',
				      },
				      title: {
				        display: false,
				        text: 'Chart.js Line Chart'
				      }
				    }
				  },
				};
				
				var myChart = new Chart(
					    document.getElementById('myChart3'),
					    config 
					  );
		}
	});
	}
	
	
	/*
	
	//달별 매출액 그리기 위한 자료
	function months(){ $.ajax({
		type: 'get',
		url: '/getSalesByMonth',
		data: {year : $('#yearByMonthSales').val()},
		success: function(jsonData){
			//console.log('성공');
			//console.log(jsonData);
			
			//let roots = numbers.map((num) => Math.sqrt(num))
			let store1 =  jsonData.filter(item => item.storeId ==1);
			let store2 = jsonData.filter(item => item.storeId ==2);
			
			//console.log(store1);
			
			let storeCount1 = store1.map(item => item.amount);
			let storeCount2 = store2.map(item => item.amount);
			//console.log(storeCount1);
			//let res = users.filter(it => it.name.includes('oli'))
			let month = store1.map(item => item.month);
			//console.log(month);
			
			
			
			const labels = month;
			const data = {
			  labels: labels,
			  datasets: [
			    {
			      label: 'store 1',
			      data: storeCount1,
			      borderColor: 'rgb(139,0,0)',
			      backgroundColor: 'rgb	(205,92,92)',
			    },
			    {
			      label: 'store 2',
			      data: storeCount2,
			      borderColor: 'rgb(25,25,112)',
			      backgroundColor: 'rgb(100,149,237)',
			    }
			  ]
			};
				const config = {
				  type: 'line',
				  data: data,
				  options: {
				    responsive: true,
				    plugins: {
				      legend: {
				        position: 'top',
				      },
				      title: {
				        display: true,
				        text: 'Chart.js Line Chart'
				      }
				    }
				  },
				};
				
				
				var myChart = new Chart(		
					    document.getElementById('myChart2'),
					    config
					  );
			
				//const DATA_COUNT = 7;
				//const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};

		}
	});
	}
	
	*/
	
	//카테고리 매출액 차트 그리기 위한 정보
	$.ajax({
		type: 'get',
		url: '/getSalesByFilmCategory',
		success: function(jsonData){
			//console.log('성공!');
			
			let labels =  new Array();
			let datas = new Array();
			

			$(jsonData).each(function(index, item){
				labels.push(item.category);
				datas.push(item.totalSales);
			});
			


			const data = {
			  labels: labels,
			  datasets: [
			    {
			      label: '카테고리 별 판매량',
			      data: datas,
			      borderColor: 'rgb(255, 99, 132)', //막대 그래프의 테두리 색인거 같습니다.
			      backgroundColor: 'rgb(255,182,193)', //막대 그래프 색깔이에요
			    }
			  ]
			};
			const config = {
					  type: 'bar',
					  data: data,
					  options: {
					    indexAxis: 'y', //'x'로 바꾸면 차트 기준축이 가로가 됩니다.!
					    // Elements options apply to all of the options unless overridden in a dataset
					    // In this case, we are setting the border of each horizontal bar to be 2px wide
					    
					    elements: {
					      bar: {
					        borderWidth: 2,//2는 차트의 테두리 넓이 입니다.
					      }
					    },
					    responsive: true,// 위 데이터의 라벨이 표시될지 정하고 위치를 정할 수 있습니다.
					    plugins: {
					      legend: {
					        position: 'right',
					      },
					      title: {//차트의 제목을 보일지 제목을 뭐로 할지 정할 수 잇습니다.
					        display: true,
					        text: '카테고리별 판매량'
					      }
					    }
					  },
					};
			
			 var myChart = new Chart(
					    document.getElementById('myChart'),
					    config
					  );
		}
	})
	
	//달별 달 변화
	
	
	monthss();
	days();
	
	
	$('#yearByMonthSales').change(function(){
		//console.log('년도 ...');
		$('#span2').empty();
		$('#span2').append('<canvas id="myChart2"></canvas>');
		monthss();
	});
	
	$('#daysBtn').click(function(){
		console.log('년도 , 달 ...');
		$('#span3').empty();
		$('#span3').append('<canvas id="myChart3"></canvas>');
		days();
	});
	
	const month2005 = [5,6,7,8];
	const month2006 = [2];
	const month2021 = [6];
	
	//달에 따라 월 바꾸기
	$('#yearByDaysSales').change(function(){
		if($('#yearByDaysSales').val() == 2005){
			$('#monthByDaysSales').empty();
			for(item of month2005){
				$('#monthByDaysSales').append('<option>'+item+'</option>');
			}
		} else if($('#yearByDaysSales').val() == 2006) {
			$('#monthByDaysSales').empty();
			for(item of month2006){
				$('#monthByDaysSales').append('<option>'+item+'</option>');
			}
		} else if($('#yearByDaysSales').val() == 2021){
			$('#monthByDaysSales').empty();
			for(item of month2021){
				$('#monthByDaysSales').append('<option>'+item+'</option>');
			}
		}
	});
	
	
});
</script>
</head>
<body>
	<div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
     <div id="main-wrapper">
     <!-- 메뉴 -->
    	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
     	
     	<div class="content-body">
            <div class="container-fluid">
            
            <!-- 제목 -->
	            <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4 class="title">매출 현황</h4>
                            <p class="mb-0">카테고리, 달,일별 매출액과 베스트셀러</p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">home</a></li>
                             <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/getSales">매출현황</a></li>
                        </ol>
                    </div>
                </div>
                <!-- 제목 끝 -->
                <div class="row">
                	<!-- 월별 매출 -->
               		<div class="col-lg-6 col-sm-6">
                         <div class="card">
                             <div class="card-header">
                                 <h4 class="card-title">월별 매출</h4>
                             </div>
                             <div class="card-body">
                                 <div id="span2">
									<canvas id="myChart2"></canvas>
								</div>
                             </div>
                         </div>
                     </div>
                     <!-- 일별 매출 -->
                     <div class="col-lg-6 col-sm-6">
                         <div class="card">
                             <div class="card-header">
                                 <h4 class="card-title">일별 매출</h4>
                                 
                                 <div class="row justify-content-end col-sm-7">
									<select id="yearByDaysSales" name="year"  class="form-control col-sm-5">
										<option>2005</option>
										<option>2006</option>
										<option>2021</option>
									</select>
									
									<select id="monthByDaysSales" name="year"  class="form-control col-sm-4">
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
									</select>
									<button id="daysBtn" class="btn col-sm">변화</button>
								</div>                                 
                             </div>
                             
                             <div class="card-body">
                                   		
                                 <div id="span3">
									<canvas id="myChart3"></canvas>
								</div>
                             </div>
                         </div>
                     </div>
         			<!-- 월별매출 끝 -->
         			
         			<!-- 카테고리별 매출집계 -->
         			
         			 <div class="col-xl-8 col-lg-8 col-md-8">
                          <div class="card">
                              <div class="card-header">
                                  <h4 class="card-title">카테고리별 매출 집계</h4>
                              </div>
                              <div class="card-body">
                                  <div id="span">
										 <canvas id="myChart"></canvas>
									</div>
                              </div>
                          </div>
                      </div>
                      
                      
                      <!-- 베스트셀러 -->
                	<div class="col-xl-4 col-lg-4 col-md-4">
                          <div class="card">
                              <div class="card-header">
                                  <h4 class="card-title">대여량 top10</h4>
                              </div>
                              <div class="card-body">
                                  <table class="table table-bordered text-center col-sm-10">
									<thead class="thead-dark">
										<tr>
											<th>제목</th>
											<th>대여수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${bestSaller}" var="b">
											<tr>
												<td class="text-left">${b.title}</td>
												<td>${b.cnt}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
                              </div>
                          </div>
                      </div>
                	
                	
                </div>
        	</div>
        </div>
     	
     	<!-- footer -->
		<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
     </div>
     
    <script src="${pageContext.request.contextPath}/vendor/global/global.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/quixnav-init.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
    <!-- Summernote -->
    <script src="${pageContext.request.contextPath}/vendor/summernote/js/summernote.min.js"></script>
    <!-- Summernote init -->
    <script src="${pageContext.request.contextPath}/js/plugins-init/summernote-init.js"></script>
</body>
</html>