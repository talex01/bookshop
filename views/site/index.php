<div class="site-index">
    <div class="container-fluid body-content col-lg-6">
        <?php
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
    function add_ajax(id) {
        $.ajax({
            type: "GET",
            url: '/site/cart?id=' + id,
            success: function () {
                alert("Книга добавлена в корзину");
                $("#id").text=123;
            }
        });
//        location.reload();
    }
</script>
