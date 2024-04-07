<%@include file="Head.jsp" %>
      <section class="py-xxl-10 pb-0" id="home">
        <div class="bg-holder bg-size" style="background-image:url(../Assets/Template/User/assets/img/gallery/hero-bg.png);background-position:top center;background-size:cover;">
        </div>
        <!--/.bg-holder-->

        <div class="container">
          <div class="row min-vh-xl-100 min-vh-xxl-25">
            <div class="col-md-5 col-xl-6 col-xxl-7 order-0 order-md-1 text-end"><img class="pt-7 pt-md-0 w-100" src="../Assets/Template/User/assets/img/gallery/hero.png" alt="hero-header" /></div>
            <div class="col-md-75 col-xl-6 col-xxl-5 text-md-start text-center py-6">
                   <h1>Welcome <%=session.getAttribute("hname")%></h1>
            
              <p class="fs-1 mb-5">Two eyes when donated can bring countless smiles  <br />to those who regaain their vision  </p>
              <!--<a class="btn btn-lg btn-primary rounded-pill" href="#!" role="button">Make an Appointment</a>-->
            </div>
          </div>
        </div>
      </section>


        <%@include file="Foot.jsp" %>