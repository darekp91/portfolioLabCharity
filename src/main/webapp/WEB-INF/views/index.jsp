<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>13</em>

            <h3>Oddanych worków</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>5</em>
            <h3>Przekazanych darów</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

    </div>
</section>

<section class="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="#" class="btn btn--large">Załóż konto</a>
</section>

<section class="about-us">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="../../resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>

    </div>
    <div class="about-us--image"><img src="<c:url value="../../resources/images/about-us.jpg"/>" alt="People in circle"/>

    </div>
</section>

<section class="help">
    <h2>Komu pomagamy?</h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy.
            Możesz sprawdzić czym się zajmują.</p>

        <ul class="help--slides-items" id="slidesContainer">
            <c:forEach items="${institutions}" var="institution" varStatus="status">
                <c:if test="${status.index % 4 == 0}">
                    <li class="slide" style="display: none;">
                </c:if>

                <c:if test="${status.index % 4 == 0 || status.index % 4 == 2}">
                    <div class="col"> <!-- Nowa kolumna dla każdej pary fundacji -->
                </c:if>

                <div class="fundation">
                    <div class="title">${institution.name}</div>
                    <div class="subtitle">${institution.description}</div>
                </div>

                <c:if test="${status.index % 4 == 1 || status.index % 4 == 3 || status.last}">
                    </div> <!-- Zamknięcie div.col -->
                </c:if>

                <c:if test="${status.index % 4 == 3 || status.last}">
                    </li>
                </c:if>
            </c:forEach>
        </ul>



        <div class="help--slides-navigation">
            <button id="slideLeft" class="slide-nav">&lt;</button> <!-- Lewa strzałka -->
        </div>

        <div class="help--slides-navigation">
            <button id="slideRight" class="slide-nav">&gt;</button> <!-- Prawa strzałka -->
        </div>
    </div>

</section>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const slides = document.querySelectorAll('.slide');
        let currentSlide = 0;

        function showSlide(index) {
            slides.forEach((slide, idx) => {
                slide.style.display = idx === index ? 'flex' : 'none';
            });
        }

        document.getElementById('slideLeft').addEventListener('click', function() {
            currentSlide = Math.max(currentSlide - 1, 0);
            showSlide(currentSlide);
        });

        document.getElementById('slideRight').addEventListener('click', function() {
            currentSlide = Math.min(currentSlide + 1, slides.length - 1);
            showSlide(currentSlide);
        });

        showSlide(currentSlide); // Pokaż pierwszy slajd na start
    });
</script>
dd

<%@ include file="footer.jsp" %>