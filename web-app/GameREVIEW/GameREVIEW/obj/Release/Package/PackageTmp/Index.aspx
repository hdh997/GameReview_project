<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="GameREVIEW.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-3">
            <div class="col-lg-9 mx-auto">
                <div class="bd-slide" style="border: 1px solid #ddd; padding: 15px; border-radius: 3px">
                    <div id="Slideshow1" class="carousel slide" data-bs-ride="carousel" >
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#Slideshow1" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#Slideshow1" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#Slideshow1" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            <button type="button" data-bs-target="#Slideshow1" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="imgs/slideShowIMGs/igor-karimov-fXmmSz5KkO8-unsplash.jpg" class="d-block" alt="gaming together" width="900" height="500">
                                <div class="carousel-caption d-none d-md-block">
                                    <h4>Welcome to GamesREVIEW</h4>
                                    <p>Share your thoughts & get connected.</p>
                                    <p>
                                        <a class="btn btn-lg btn-success" href="ForumPage.aspx">Visit Forum</a>
                                    </p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="imgs/slideShowIMGs/pexels-fox-1038916.jpg" class="d-block" alt="desktop" width="900" height="500">
                                <div class="carousel-caption d-none d-md-block">
                                    <h3>How does it work?</h3>
                                    <p>Simply Sign Up, Login & Get Started.</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="imgs/slideShowIMGs/pexels-lucie-liz-3165335.jpg" class="d-block" alt="a Setup" width="900" height="500">
                                <div class="carousel-caption d-none d-md-block">
                                    <h3>Gaming is life.</h3>
                                    <p>But gaming wise! Spend time with friends too. </p>
                                </div>
                            </div>
                            <div class="carousel-item" data-bs-interval="10000">
                                <img src="imgs/slideShowIMGs/pexels-mike-esparza-3702458.jpg" class="d-block" alt="gameboi" width="900" height="500">
                                
                                <div class="carousel-caption d-none d-md-block">
                                    <h3>Start Your Journey</h3>
                                    <p>Become a GameReviewer and Share your thoughts</p>
                                    <p>
                                        <a class="btn btn-lg btn-primary" href="UserSignUpPage.aspx">Register Here</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#Slideshow1" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#Slideshow1" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
