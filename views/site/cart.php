<style>

    td {
        border: 1px dashed #7d7d7d;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 10px;
    }
    th{
        text-align: center;
    }
</style>
<div class="site-index">
    <div class="container-fluid body-content">
        <?php
        session_start();
        use app\models\Books;
        use app\models\Cart;
        use app\models\Author;
        $this->title = 'Cart';
        $sum = 0;

        isset($_SESSION['order']) ? $order = $_SESSION['order'] : $order = array();

        if(isset($_GET['del'])){
            unset ($order[$_GET['del']]);
            sort($order);
            $_SESSION['order'] = $order;
        }

        if(isset($_GET['id'])){
            $order[] = $_GET['id'];
            sort($order);
            $_SESSION['order'] = $order;
        }
if(count($order)>0) {
    echo "<table style='width: 100% '>
                <thead>
                    <tr>
                    <th>Название</th>
                    <th>Цена</th>
                    </tr>
                </thead>";
    for ($i = 0; $i < count($order); $i++) {

        $book = Books::find()
            ->where(['id' => $order[$i]])
            ->one();

        $author = Author::find()
            ->where(['id' => $book->author_fk_id])
            ->one();

//            echo "<pre>";
//            var_dump($author);
//            echo "</pre>";
        $sum += $book->price;
        echo "
                    <tr>
                        <td><img src='{$book->img_src}' style='width: 50px;'> {$author->name} - {$book->title}</td>
                        <td style='text-align: center;'>{$book->price} грн <img id='del_id_$i' src='/img/del.png' onclick='del_ajax($i)'/></td>
                    </tr>";
    }
    echo "<tfoot>
                <tr>
                <th>
                    Итого:
                </th>
                <th>
                    {$sum} грн
                    </th>
                </tr>
             </tfoot></table>";
}else{
            echo "<h2>Здесь пока пусто :(</h2>";
}?>
    </div>
</div>

<a href="/site"><button class="btn btn-success" style="margin-top: 30px;">Вернуться</button></a>
<button class="btn btn-success col-lg-offset-9 col-md-offset-8 col-xs-offset-7" style="margin-top: 30px;" onclick="order()">Оформить заказ</button>

<script type="application/javascript">
    document.getElementById("w1").firstElementChild.innerHTML="<a href='/site/cart'>Cart <sup style='color: white'><?php if(isset($_SESSION['order'])) echo count($_SESSION['order']); else echo "0"; ?></sup></a>";
    function del_ajax(id){
        $.ajax({
            type: "GET",
            url: '/site/cart?del='+id
        });
        location.reload();
    }

    function order() {
        alert("Спасибо за заказ, с Вами свяжется наш менеджер для уточнения деталей");
        location.href="/site";
        // Здесь должен быть обработчик заказов
//        $.ajax({
//            type:"POST",
//            url: '/site/order'
//        });
    }
</script>
