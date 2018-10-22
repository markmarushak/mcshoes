<?php

class ControllerAjaxOrder extends Controller
{
    public function index($id = null)
    {
        $request = $_POST["data"];
        $this->load->model("tool/ajax");
        if ($this->model_tool_ajax->isTable("oc_bot_orders")){
            $text =
                urldecode(
                    "\r\n Имя :".$request["firstname"].
                    "\r\n Телефон :".$request["phone"].
                    "\r\n ид продукта :".$request["product_id"].
                    "\r\n Название Обуви :".$request["title"].
                    "\r\n Размер :".$request["sizes"].
                    "\r\n Цена :".$request["price"].
                    "Артикль :".$request["article"]);

            file_get_contents("https://api.telegram.org/bot633808414:AAGgQ3vSO6-7vdRj4YFnLTGuh1P302bmCuM/sendMessage?chat_id=417517295&text=".$text);
//           $result = $this->model_tool_ajax->addOrder($request);
        }
        echo json_encode("good");

    }
}