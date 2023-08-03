package gg.lolco.common;

public class PageFactory {
   
   public static String getPage(int cPage, int numPerpage, int totalData, String url) {
         
         StringBuffer pageBar=new StringBuffer();
         
         int totalPage=(int)(Math.ceil((double)totalData/numPerpage));
         int pageBarSize=5;
         int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
         int pageEnd=pageNo+pageBarSize-1;
         
         pageBar.append("<div class=\"pageBar\"><div class=\"pageAll\"><ul class=\"page\">");
         
         if(pageNo==1) {
            pageBar.append("<li class='disabled'>");
            pageBar.append("<span class='content'>&lt;");
            pageBar.append("</span>");
            pageBar.append("</li>");
         }else {
            pageBar.append("<li class=''>");
            pageBar.append("<a class='page-link' href='javascript:fn_paging("+(pageNo-5)+")'>&lt;");
            pageBar.append("</a>");
            pageBar.append("</li>");
         }
         
         while(!(pageNo>pageEnd||pageNo>totalPage)) {
            if(pageNo==cPage) {
               pageBar.append("<li class='disabled'>");
               pageBar.append("<span class='nowPage content' >"+pageNo);
               pageBar.append("</span>");
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
            pageBar.append("<span class='content'>&gt;");
            pageBar.append("</span>");
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