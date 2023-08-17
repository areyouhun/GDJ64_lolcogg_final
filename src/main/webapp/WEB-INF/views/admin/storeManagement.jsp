<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- CSS -->
<link rel="stylesheet" href="${path}/resources/css/admin/style_adminStore.css">
<style>

</style>
<title>상점관리</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin">
				<article class="admin-common-container">
					<div class="admin-common-upper">
						<p class="mainTitle fs-35 mainTitleMargin">상점관리</p>
						<div class="flex-grow"></div>
						<div class="admin-common-link">
							<a class="title" href="${path}/admin/reportManagement">신고관리</a>
							<a class="title" href="${path}/admin/memberManagement">회원관리</a>
						</div>
					</div>
					<!-- WRITE YOUR CODE HERE -->
					<div>
						<div id="chart">
							<canvas id="myChart"></canvas>
						</div>
						<div id="tableContainer">
							<table>
								<tr style="height: 5vh;">
									<th style="width:20%;">아이템 번호</th>
									<th>아이템 이름</th>
									<th>아이템 가격</th>
									<th>수정가격</th>
									<th>가격 수정</th>
								</tr>
								<c:if test="${not empty saleListAll}">
		                        	<c:forEach var="s" items="${saleListAll }">
			                        	<tr style="height: 5vh;">
											<td>${s.itemNo }</td>
											<td>${s.itemName}</td>
											<td>${s.itemPrice }</td>
											<td><input type="text" class="changePrice"></td>
											<td><button class="editPrice">수정</button></td>
										</tr>
		                        	</c:forEach>
		                        </c:if>
							</table>
						</div>
					</div>
				</article>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
            let context = document
                .getElementById('myChart')
                .getContext('2d');
            let myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        <c:if test="${not empty saleListAll}">
                        	<c:forEach var="s" items="${saleListAll }">
                        		'${s.itemName}',
                        	</c:forEach>
                        </c:if>
                        
                       ],
                    datasets: [
                        {
                            label: '1일 기준 판매량',
                            fill: false,
                            data: [
                            	<c:if test="${not empty saleListOne}">
	                            	<c:forEach var="s" items="${saleListOne }">
	                            		'${s.sale}',
	                            	</c:forEach>
	                            </c:if>
                            ],
                            backgroundColor: 'rgba(220, 20, 60,0.6)',
                            borderColor: 'rgba(220, 20, 60,1)',
                            borderWidth: 1
                            
                        },
                        {
                            label: '일주일 기준 판매량',
                            fill: false,
                            data: [
                            	<c:if test="${not empty saleListWeek}">
	                            	<c:forEach var="s" items="${saleListWeek }">
	                            		'${s.sale}',
	                            	</c:forEach>
	                            </c:if>
                            ],
                            backgroundColor: 'rgba(250, 204, 50,0.6)',
                            borderColor: 'rgba(250, 204, 50,1)',
                            borderWidth: 1
                        },
                        { //데이터
                            label: '총 판매량', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	<c:if test="${not empty saleListAll}">
	                            	<c:forEach var="s" items="${saleListAll }">
	                            		'${s.sale}',
	                            	</c:forEach>
	                            </c:if>
                            ],
                            backgroundColor: 'rgba(0, 102, 204,0.6)',
                            borderColor: 'rgba(0, 102, 204,1)',
                            borderWidth: 1
                            
                        } 
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
          </script>
          <script>
          	$('.editPrice').click(function(e){
          		const price=$(e.target).parent().parent().find("input").val();
          		const itemNo=$(e.target).parent().parent().children(":first").text();
          		if(price==""){
          			alert("가격을 적어주세요!")
          		}else{
          			$.ajax({
						type : 'POST',
						url : '${path}/admin/changePrice',
						data : {
							"price" : price,
							"itemNo" : itemNo
						},
						success : function(){
							alert("가격을 수정하였습니다.")
							location.href='${path}/admin/storeManagement';
						},
						error : function(request, status, error) { 
					        console.log(error)
					    }
					}) 
          		}
          	})
          </script>
    </body>
</html>
</body>
</html>
