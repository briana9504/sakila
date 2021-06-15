<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
					        display: true,
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
				        display: true,
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
	
	$('#btn').click(function(){
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
<style>
	#span, #span3{
		width:50%; height:50%;
	}
	
	 #span2{
	 	width:50%; height:50%;
	}
</style>
</head>
<body>
	<h3>카테고리별 매출집계</h3>
	
	<div id="span">
		 <canvas id="myChart"></canvas>
	</div>
	
	
	<h3>베스트 셀러</h3>
	
	<table border="1">
		<thead>
			<tr>
				<th>제목</th>
				<th>총 대여횟수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bestSaller}" var="b">
				<tr>
					<td>${b.title}</td>
					<td>${b.cnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<h3>월별 매출</h3>

	<div id="span2">
		<canvas id="myChart2"></canvas>
	</div>
	
	
	
	
	<h3>일별 매출</h3>
	<div>
		<select id="yearByDaysSales" name="year">
			<option>2005</option>
			<option>2006</option>
			<option>2021</option>
		</select>
		
		<select id="monthByDaysSales" name="year">
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
		</select>
		<button id="btn">날짜바꾸기</button>
	</div>
	<div id="span3">
		<canvas id="myChart3"></canvas>
	</div>

</body>
</html>