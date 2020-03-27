(function($) {
  "use strict"; // Start of use strict

  // Toggle the side navigation
  $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Close any open menu accordions when window is resized below 768px
  $(window).resize(function() {
    if ($(window).width() < 768) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
  $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
    if ($(window).width() > 768) {
      var e0 = e.originalEvent,
        delta = e0.wheelDelta || -e0.detail;
      this.scrollTop += (delta < 0 ? 1 : -1) * 30;
      e.preventDefault();
    }
  });

  // Scroll to top button appear
  $(document).on('scroll', function() {
    var scrollDistance = $(this).scrollTop();
    if (scrollDistance > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  // Smooth scrolling using jQuery easing
  $(document).on('click', 'a.scroll-to-top', function(e) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: ($($anchor.attr('href')).offset().top)
    }, 1000, 'easeInOutExpo');
    e.preventDefault();
  });

  // pagination click event
  $(function(){
    var sBtn = $("div > li");
    sBtn.find("a").click(function(){
     sBtn.removeClass("active");
     $(this).parent().addClass("active");
    });
   });
  

  // search form
  $(function(){
    $(".input-group-btn .dropdown-menu li a").click(function(){
        var selText = $(this).html();
       $(this).parents('.input-group-btn').find('.btn-search').html(selText);

     });
  });
  
//  function returnHandle(){
//	  location.href="<%= request.getContextPath() %>/views/branch/reservmanagement/returnDetailHandle.jsp";
//  }
  
  $(function(){
	  $("#return-detail-view-bt").click(function(){
		 location.href="returnDetailHandle.jsp"; 
	  });
  });

//  // page move(detail page)
//  $(function(){
//    $("#return-user-table tr td").click(function(){
//      // var str = "";
//      // var tdArr = new Array();
//
//      // var tr = $(this);
//      // var td = tr.children();
//
//      // console.log(tr.text());
//
//      // td.each(function(i){
//      //   tdArr.push(td.eq(i).text());
//      // });
//
//      // console.log(tdArr);
//      location.href='return-page-detail.html';
//    });
//
//    $("#reserv-user-table tr td").click(function(){
//      location.href='reserv-client-detail.html';
//    });
//
//    $("#return-detail-view-bt").click(function(){
//      location.href='return-page-detail-bt.html';
//    });
//
//    $("#event-table tr td").click(function(){
//      location.href='event-detail.html';
//    });
//
//    $("#notice-table tr td").click(function(){
//      location.href='notice-detail.html';
//    });
//
//    $("#rent-list-table tr td").click(function(){
//      location.href='<%= request.getContextPath()%>/views/branch/reservmanagement/rentList.jsp';
//    });
//
//    // 공지사항 목록
//    $("#notice-back-list").click(function(){
//      location.href='notice.html';
//    });
//
//    // 공지사항 등록
//    $("#notice-enroll-bt").click(function(){
//      location.href='notice-write.html';
//    });
//
//    // 공지사항 수정
//    $("#notice-detail-modify-bt").click(function(){
//      location.href='notice-modify.html';
//    });
//
//    // 이벤트 목록
//    $("#event-back-list").click(function(){
//      location.href='event.html';
//    });
//
//    // 이벤트 등록
//    $("#event-enroll-bt").click(function(){
//      location.href='event-write.html';
//  });
//
//    // 이벤트 수정
//    $("#event-detail-modify-bt").click(function(){
//      location.href='event-modify.html';
//    });
//  });

})(jQuery); // End of use strict
