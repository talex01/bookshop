<div class="site-index">
    <div class="container-fluid body-content col-lg-6">
        <?php
        session_start();
        use app\models\Books;
        use app\models\Author;
        use app\models\Category;

        $this->title = 'Book Shop';

        $books = Books::find()->all();
        foreach ($books as $book) {

            $author = Author::find()
                ->where(['id' => $book->author_fk_id])
                ->one();
            $genre = Category::find()
                ->where(['id' => $book->category_fk_id])
                ->one();
            echo "<h2><a href='mailto:{$author['email']}'>{$author['name']}</a><p>{$book->title}</p></h2>";
            if (isset($book->img_src)) {
                echo "<img src='{$book->img_src}' style='width: 200px'>";
            }
            echo "<p>{$book->description}</p>
                <small>Жанр: {$genre->name}</small>
                <h4>Цена: {$book->price} грн <span class='glyphicon glyphicon-shopping-cart' onclick='add_ajax($book->id)'></span></h4><hr>";
        }
        ?>
    </div>
</div>

<script type="application/javascript">
    document.getElementById("w1").firstElementChild.innerHTML="<a href='/site/cart'>Cart <sup style='color: white'><?php if(isset($_SESSION['order'])) echo count($_SESSION['order']); else echo "0"; ?></sup></a>";

    function add_ajax(id) {
        $.ajax({
            type: "POST",
            url: "/site/cart",
            data: "id="+id,
            success: function () {
                alert("Товар добавлен в корзину");
                location.reload();
            }
        });
    }
</script>
