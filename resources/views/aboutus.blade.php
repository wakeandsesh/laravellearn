<x-app>
    <section class="aboutus">
        <div class="aboutus__title">
            О нас
        </div>

        <div class="aboutus__wrapper">
            <div class="aboutus__img">
                <img src="{{ asset('/img/aboutus-img.png') }}" alt="">
            </div>
            <div class="aboutus__info">
                <div class="aboutus__name">
                    <h2>VIKI GRILL</h2>
                    <h3>Burgers and Coffe</h3>
                </div>
                <div class="aboutus__adress">
                    <div class="sidebar__contacts">
                        <div class="sidebar__adress">
                            адресс: г.Никополь, ул. Трубников, 91
                        </div>
                        <a class="sidebar__phone" href="tel:+380731234488">tel: +38 073 123 44 88</a>
                    </div>
                </div>
                <a class="aboutus__findonmap" target="_blank" href="https://goo.gl/maps/smT7ReH72WaB3zoC9">Найти на карте</a>
                <div class="aboutus__description">
                    Gigon gogen. Nitost krotaska. Relig vilig. <br>
                    Spenar bion. Katt rähären. <br>
                    Ist depoprese. Antesk. Hexagök dosavis. <br>
                    Presamma heteroligen
                </div>
                <a href="{{ route('categories.index') }}" class="aboutus__button">Посмотреть меню</a>
            </div>
        </div>
    </section>
</x-app>

