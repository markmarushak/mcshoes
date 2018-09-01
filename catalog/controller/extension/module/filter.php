<?php

class ControllerExtensionModuleFilter extends Controller {
	public function index() {
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$category_id = end($parts);

		$this->load->model('catalog/category');
        $this->load->model('tool/regex');


        $category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->load->language('extension/module/filter');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['button_filter'] = $this->language->get('button_filter');

            $url = '';


            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }
            if (isset($this->request->get['brand'])) {
                $url .= '&brand=' . $this->request->get['brand'];
            }
            if (isset($this->request->get['size'])) {
                $url .= '&size='. $this->request->get['size'];
            }
            if (isset($this->request->get['min'])) {
                $url .= '&min='. $this->request->get['min'];
            }
            if (isset($this->request->get['max'])) {
                $url .= '&max='. $this->request->get['max'];
            }

            $url .= '&';


            if (isset($this->request->get['order'])) {
                $order = $this->request->get['order'];
            } else {
                $order = 'ASC';
            }

            if (isset($this->request->get['sort'])) {
                $sort = $this->request->get['sort'];
            } else {
                $sort = 'p.sort_order';
            }

            if (isset($this->request->get['limit'])) {
                $limit = (int)$this->request->get['limit'];
            } else {
                $limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
            }

            $data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path']));
            $data['url'] = $url;

            $data['order'] = $order;
            $data['sort'] = $sort;
            $data['limit'] = $limit;

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $this->model_tool_regex->regx($url,'sort','order'))
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $this->model_tool_regex->regx($url,'sort','order'))
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $this->model_tool_regex->regx($url,'sort','order'))
            );

            $data['limits'] = array();

            $limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach($limits as $value) {
                $data['limits'][] = array(
                    'text'  => $value,
                    'value' => $value,
                    'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $this->model_tool_regex->regx($url,'limit') . '&limit=' . $value)
                );
            }

			$this->load->model('catalog/product');

			$data['filter_groups'] = array();
			$filter_groups = $this->model_catalog_category->getCategoryAttr();

			if ($filter_groups) {
				foreach ($filter_groups as $filter_group) {
                    $add = [];
					foreach ($filter_group as $filter => $value) {
                        $data['name_filter'][$filter] = array();
                        $fil_name = $filter;
                        $fil_val = $value;
                    }
                    foreach ($fil_val as $fil)
                    {
                        if (is_array($fil))
                            foreach ($fil as $f) {
                                if (is_array($f)) {
                                    $facts = $f;
                                    if (isset($facts)){
                                        $add['link'] = $data['action'] . $this->model_tool_regex->regx($url,$fil_name) .'&'. $fil_name.'='.$f['name'];
                                        $facts['val'] = $add['link'];
                                        $data['name_filter'][$fil_name][] = $facts;
                                    }
                                }
                            }
                    }

				}
                $data['text_sort'] = $this->language->get('text_sort');
                $data['text_limit'] = $this->language->get('text_limit');

				return $this->load->view('extension/module/filter', $data);
			}
		}
	}
}