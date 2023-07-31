package gg.lolco.common;

public class PageFactory {
	
	public static String getPage(int cPage, int numPerpage, int totalData, String url) {
	      
	      StringBuffer pageBar=new StringBuffer();
	      
	      int totalPage=(int)(Math.ceil((double)totalData/numPerpage));
	      int pageBarSize=5;
	      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	      int pageEnd=pageNo+pageBarSize-1;
	      
//	      <div class="pageBar">
//          <div class="pageAll">
//              <ul class="page">
//                  <li><a href="#">&lt;</a></li>
//                  <li><a href="#">1</a></li>
//                  <li><a href="#" class="nowPage">2</a></li>
//                  <li><a href="#">3</a></li>
//                  <li><a href="#">4</a></li>
//                  <li><a href="#">5</a></li>
//                  <li><a href="#">&gt;</a></li>
//              </ul>
//          </div>
//      </div>
	      
	      
	      pageBar.append("<div class=\"pageBar\"><div class=\"pageAll\"><ul class=\"page\">");
	      
	      if(pageNo==1) {
	         pageBar.append("<li class='disabled'>");
	         pageBar.append("<a class='' href='#'>&lt;");
	         pageBar.append("</a>");
	         pageBar.append("</li>");
	      }else {
	         pageBar.append("<li class=''>");
	         pageBar.append("<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>&lt;");
	         pageBar.append("</a>");
	         pageBar.append("</li>");
	      }
	      
	      while(!(pageNo>pageEnd||pageNo>totalPage)) {
	         if(pageNo==cPage) {
	            pageBar.append("<li class='disabled'>");
	            pageBar.append("<a class='nowPage' href='#'>"+pageNo);
	            pageBar.append("</a>");
	            pageBar.append("</li>");
	         }else {
	            pageBar.append("<li class=''>");
	            pageBar.append("<a class='' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo);
	            pageBar.append("</a>");
	            pageBar.append("</li>");
	         }
	         pageNo++;
	      }
	      
	      if(pageNo>totalPage){
	         pageBar.append("<li class='disabled'>");
	         pageBar.append("<a class='' href='#'>&gt;");
	         pageBar.append("</a>");
	         pageBar.append("</li>");
	      }else {
	         pageBar.append("<li class=''>");
	         pageBar.append("<a class='' href='javascript:fn_paging("+(pageNo)+")'>&gt;");
	         pageBar.append("</a>");
	         pageBar.append("</li>");
	      }
	      pageBar.append("</ul></div></div>");
	      
	      pageBar.append("<script>");
	      pageBar.append("function fn_paging(no){");
	      pageBar.append("location.assign('"+url+"?cPage='+no+'&numPerpage="+numPerpage+"');");
	      pageBar.append("}");
	      pageBar.append("</script>");
	      
	      return new String(pageBar);
	      
	   }
	
}
