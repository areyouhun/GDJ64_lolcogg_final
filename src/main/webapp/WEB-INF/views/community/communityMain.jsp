<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>
<!-- Your own style tag or CSS file -->

<!------------------------------------>
<title>SAMPLE</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="navBgColor" value="nav-black"/>
</jsp:include>
    <section>
        <div class="center-1280 background-img mainpage mainHeight">
            <div class="width-1280 page-margin community-centent">
                <div class="community-left">
                    <div class="myinfo">
                        <button class="community-login">로그인</button>
                    </div>
                    <div class="categories">
                        <p class="categoriesSubtitle">홈</p>
                        <a href="">
                            <div class="categoriesName">
                                <p>전체보기</p>
                            </div>
                        </a>
                        <p class="categoriesSubtitle">커뮤니티</p>
                        <a href="">
                            <div class="categoriesName">
                                <p>정보</p>
                            </div>
                        </a>
                        <a href="">
                            <div class="categoriesName">
                                <p>자유</p>
                            </div>
                        </a>
                        <a href="">
                            <div class="categoriesName">
                                <p>유머</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="community-center-list">
                    <div class="community-center-size">
                        <div class="board-categories-div">
                            <p class="board-categories fs-35">전체</p>
                            <button class="writing-button">
                                <p>글쓰기</p>
                            </button>
                        </div>
                        <div class="popular-latest-Button">
                            <div>
                                <button class="button">
                                    <p>인기글</p>
                                </button>
                                <button class="button">
                                    <p>최신글</p>
                                </button>
                            </div>

                            <form action="">
                                <div>
                                    <select class="select-div">
                                        <option value="제목+내용">제목+내용</option>
                                        <option value="제목">제목</option>
                                        <option value="내용">내용</option>
                                        <option value="글쓴이">글쓴이</option>
                                    </select>
                                    <div class="board-search-div">
                                        <input placeholder="검색">
                                        <img src="./img/돋보기.svg" alt="돋보기">
                                    </div>
                                </div>
                            </form>

                        </div>
                        <hr class="hr-1">
                        <div class="board-content">
                            <a href="">
                                <div class="board-title-div">
                                    <span class="board-title">암온더넥스트레벨~개발도상국~롤코지지~파파파이팅팅</span>
                                    <span class="comment">[25]</span>
                                </div>
                            </a>
                            <div class="board-bottom">
                                <div>
                                    <span>유머</span><span class="Backslash">|</span> <span><span
                                            class="designation">[고심이]</span> 똥제동이</span> <span
                                        class="Backslash">|</span><span>3분전</span>
                                </div>

                                <div class="board-img">
                                    <div>
                                        <img src="./img/조회수.svg" alt=""><span>1224</span>
                                    </div>

                                    <div>
                                        <img src="./img/버프.svg " alt=""><span>300</span>
                                    </div>

                                    <div>
                                        <img src="img/너프.svg" alt=""> <span>200</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="board-content">
                            <a href="">
                                <div class="board-title-div">
                                    <span class="board-title">암온더넥스트레벨~개발도상국~롤코지지~파파파이팅팅</span>
                                    <span class="comment">[25]</span>
                                </div>
                            </a>
                            <div class="board-bottom">
                                <div>
                                    <span>유머</span><span class="Backslash">|</span> <span><span
                                            class="designation">[고심이]</span> 똥제동이</span> <span
                                        class="Backslash">|</span><span>3분전</span>
                                </div>

                                <div class="board-img">
                                    <div>
                                        <img src="./img/조회수.svg" alt=""><span>1224</span>
                                    </div>

                                    <div>
                                        <img src="./img/버프.svg " alt=""><span>300</span>
                                    </div>

                                    <div>
                                        <img src="img/너프.svg" alt=""> <span>200</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="board-content">
                            <a href="">
                                <div class="board-title-div">
                                    <span class="board-title">암온더넥스트레벨~개발도상국~롤코지지~파파파이팅팅</span>
                                    <span class="comment">[25]</span>
                                </div>
                            </a>
                            <div class="board-bottom">
                                <div>
                                    <span>유머</span><span class="Backslash">|</span> <span><span
                                            class="designation">[고심이]</span> 똥제동이</span> <span
                                        class="Backslash">|</span><span>3분전</span>
                                </div>

                                <div class="board-img">
                                    <div>
                                        <img src="./img/조회수.svg" alt=""><span>1224</span>
                                    </div>

                                    <div>
                                        <img src="./img/버프.svg " alt=""><span>300</span>
                                    </div>

                                    <div>
                                        <img src="img/너프.svg" alt=""> <span>200</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="hr-1">
                        <div class="board-content">
                            <a href="">
                                <div class="board-title-div">
                                    <span class="board-title">암온더넥스트레벨~개발도상국~롤코지지~파파파이팅팅</span>
                                    <span class="comment">[25]</span>
                                </div>
                            </a>
                            <div class="board-bottom">
                                <div>
                                    <span>유머</span><span class="Backslash">|</span> <span><span
                                            class="designation">[고심이]</span> 똥제동이</span> <span
                                        class="Backslash">|</span><span>3분전</span>
                                </div>

                                <div class="board-img">
                                    <div>
                                        <img src="./img/조회수.svg" alt=""><span>1224</span>
                                    </div>

                                    <div>
                                        <img src="./img/버프.svg " alt=""><span>300</span>
                                    </div>

                                    <div>
                                        <img src="img/너프.svg" alt=""> <span>200</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="community-right">
                    <div class="community-right-size">
                        <div class="community-right-top">
                            <p>실시간 인기글</p>
                            <p>최근 24시간 기준</p>
                        </div>
                        <a href="">
                            <div class="realTime-popularity">
                                <p id="realTime1">1</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p>2</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p>3</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p>4</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p>5</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p>6</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p>7</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p>8</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p>9</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>
                        <a href="">
                            <div class="realTime-popularity">
                                <p id="realTime10">10</p>
                                <p>[유머]</p>
                                <P>동제동이 우산을 놓고가는영상</P>
                            </div>
                        </a>

                    </div>

                </div>

            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="${path}/resources/js/jquery-3.7.0.min.js"></script>
<script src="${path}/resources/js/script_common.js"></script>
<!-- Your own script tag or JavaScript file -->

<!-------------------------------------------->
</body>
</html>
