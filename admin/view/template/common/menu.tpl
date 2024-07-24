<ul id="menu">
  <li id="dashboard"><a href="<?php echo $home; ?>"><i class="fa fa-dashboard fa-fw"></i> <span>لوحة القيادة</span></a></li>
  <li id="catalog"><a class="parent"><i class="fa fa-tags fa-fw"></i> <span>القائمة</span></a>
    <ul>
      <li><a href="<?php echo $category; ?>">التصنيفات</a></li>
      <li><a href="<?php echo $product; ?>">المنتجات</a></li>
      <li><a href="<?php echo $recurring; ?>">الملامح المتكررة</a></li>
      <li><a href="<?php echo $filter; ?>">التصنيفات</a></li>
      <li><a class="parent">السمات</a>
        <ul>
          <li><a href="<?php echo $attribute; ?>">السمات</a></li>
          <li><a href="<?php echo $attribute_group; ?>">مجموعات السمات</a></li>
        </ul>
      </li>
      <li><a href="<?php echo $option; ?>">الخيارات</a></li>
      <li><a href="<?php echo $manufacturer; ?>">المصنعين</a></li>
      <li><a href="<?php echo $download; ?>">التحميلات</a></li>
      <li><a href="<?php echo $review; ?>">المراجعات</a></li>
      <li><a href="<?php echo $information; ?>">المراجعات</a></li>
    </ul>
  </li>
  <li id="extension"><a class="parent"><i class="fa fa-puzzle-piece fa-fw"></i> <span>الملحقات</span></a>
    <ul>
      <li><a href="<?php echo $installer; ?>">مثبت التمديد</a></li>
      <li><a href="<?php echo $modification; ?>">التعديلات</a></li>
      <li><a href="<?php echo $analytics; ?>">التحليلات</a></li>
      <li><a href="<?php echo $captcha; ?>">كلمة التحقق</a></li>
      <li><a href="<?php echo $feed; ?>">الاقتات</a></li>
      <li><a href="<?php echo $fraud; ?>">مكافحة الغش</a></li>
      <li><a href="<?php echo $module; ?>">الوحدات</a></li>
      <li><a href="<?php echo $payment; ?>">المدفوعات</a></li>
      <li><a href="<?php echo $shipping; ?>">الشحن</a></li>
      <li><a href="<?php echo $total; ?>">ترتيب الإجماليات</a></li>
      <?php if ($openbay_show_menu == 1) { ?>
      <li><a class="parent"><?php echo $text_openbay_extension; ?></a>
        <ul>
          <li><a href="<?php echo $openbay_link_extension; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
          <li><a href="<?php echo $openbay_link_orders; ?>"><?php echo $text_openbay_orders; ?></a></li>
          <li><a href="<?php echo $openbay_link_items; ?>"><?php echo $text_openbay_items; ?></a></li>
          <?php if ($openbay_markets['ebay'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_ebay; ?></a>
            <ul>
              <li><a href="<?php echo $openbay_link_ebay; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_links; ?>"><?php echo $text_openbay_links; ?></a></li>
              <li><a href="<?php echo $openbay_link_ebay_orderimport; ?>"><?php echo $text_openbay_order_import; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['amazon'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_amazon; ?></a>
            <ul>
              <li><a href="<?php echo $openbay_link_amazon; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazon_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazon_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['amazonus'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_amazonus; ?></a>
            <ul>
              <li><a href="<?php echo $openbay_link_amazonus; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazonus_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_amazonus_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
          <?php if ($openbay_markets['etsy'] == 1) { ?>
          <li><a class="parent"><?php echo $text_openbay_etsy; ?></a>
            <ul>
              <li><a href="<?php echo $openbay_link_etsy; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
              <li><a href="<?php echo $openbay_link_etsy_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
              <li><a href="<?php echo $openbay_link_etsy_links; ?>"><?php echo $text_openbay_links; ?></a></li>
            </ul>
          </li>
          <?php } ?>
        </ul>
      </li>
      <?php } ?>
    </ul>
  </li>
  <li id="design"><a class="parent"><i class="fa fa-television fa-fw"></i> <span>التصميم</span></a>
    <ul>
      <li><a href="<?php echo $layout; ?>">التخطيطات</a></li>
      <li><a href="<?php echo $banner; ?>">لافتات</a></li>
    </ul>
  </li>
  <li id="sale"><a class="parent"><i class="fa fa-shopping-cart fa-fw"></i> <span>المبيعات</span></a>
    <ul>
      <li><a href="<?php echo $order; ?>">الطلبات</a></li>
      <li><a href="<?php echo $order_recurring; ?>">الطلبات المتكررة</a></li>
      <li><a href="<?php echo $return; ?>">العائدات</a></li>
      <li><a class="parent">قسائم الهدايا</a>
        <ul>
          <li><a href="<?php echo $voucher; ?>">قسائم الهدايا</a></li>
          <li><a href="<?php echo $voucher_theme; ?>">سمات القسيمة</a></li>
        </ul>
      </li>
      <li><a class="parent">باي بال</a>
        <ul>
          <li><a href="<?php echo $paypal_search ?>">بحث</a></li>
        </ul>
      </li>
    </ul>
  </li>
  <li id="customer"><a class="parent"><i class="fa fa-user fa-fw"></i> <span>الزبائن</span></a>
    <ul>
      <li><a href="<?php echo $customer; ?>">الزبائن</a></li>
      <li><a href="<?php echo $customer_group; ?>">مجموعات العملاء</a></li>
      <li><a href="<?php echo $custom_field; ?>">الحقول المخصصة</a></li>
    </ul>
  </li>
  <li><a class="parent"><i class="fa fa-share-alt fa-fw"></i> <span>تسويق</span></a>
    <ul>
      <li><a href="<?php echo $marketing; ?>">تسويق</a></li>
      <li><a href="<?php echo $affiliate; ?>">الشركات التابعة</a></li>
      <li><a href="<?php echo $coupon; ?>">كوبونات</a></li>
      <li><a href="<?php echo $contact; ?>">بريد</a></li>
    </ul>
  </li>
  <li id="system"><a class="parent"><i class="fa fa-cog fa-fw"></i> <span>النظام</span></a>
    <ul>
      <li><a href="<?php echo $setting; ?>">إعدادات</a></li>
      <li><a class="parent">المستخدمون</a>
        <ul>
          <li><a href="<?php echo $user; ?>">المستخدمون</a></li>
          <li><a href="<?php echo $user_group; ?>">مجموعات الاعضاء</a></li>
          <li><a href="<?php echo $api; ?>"><?php echo $text_api; ?></a></li>
        </ul>
      </li>
      <li><a class="parent">الموقع</a>
        <ul>
          <li><a href="<?php echo $location; ?>">موقع المتجر</a></li>
          <li><a href="<?php echo $language; ?>">اللغات</a></li>
          <li><a href="<?php echo $currency; ?>">العملات</a></li>
          <li><a href="<?php echo $stock_status; ?>">حالات الأسهم</a></li>
          <li><a href="<?php echo $order_status; ?>">ترتيب الحالات</a></li>
          <li><a class="parent">عائدات</a>
            <ul>
              <li><a href="<?php echo $return_status; ?>">حالات العودة</a></li>
              <li><a href="<?php echo $return_action; ?>">عودة الإجراءات</a></li>
              <li><a href="<?php echo $return_reason; ?>">أسباب العودة</a></li>
            </ul>
          </li>
          <li><a href="<?php echo $country; ?>">بلدان</a></li>
          <li><a href="<?php echo $zone; ?>">المناطق</a></li>
          <li><a href="<?php echo $geo_zone; ?>">المناطق الجغرافية</a></li>
          <li><a class="parent">الضرائب</a>
            <ul>
              <li><a href="<?php echo $tax_class; ?>">فئات الضرائب</a></li>
              <li><a href="<?php echo $tax_rate; ?>">معدلات الضرائب</a></li>
            </ul>
          </li>
          <li><a href="<?php echo $length_class; ?>">فئات الطول</a></li>
          <li><a href="<?php echo $weight_class; ?>">فئات الوزن</a></li>
        </ul>
      </li>
      <li><a class="parent">أدوات</a>
        <ul>
          <li><a href="<?php echo $upload; ?>">التحميلات</a></li>
          <li><a href="<?php echo $backup; ?>">اسنرجاع البيانات</a></li>
          <li><a href="<?php echo $error_log; ?>">سجلات الأخطاء</a></li>
        </ul>
      </li>
    </ul>
  </li>
  <li id="reports"><a class="parent"><i class="fa fa-bar-chart-o fa-fw"></i> <span>التقارير</span></a>
    <ul>
      <li><a class="parent">مبيعات</a>
        <ul>
          <li><a href="<?php echo $report_sale_order; ?>">الطلبات</a></li>
          <li><a href="<?php echo $report_sale_tax; ?>">ضريبة</a></li>
          <li><a href="<?php echo $report_sale_shipping; ?>">الشحن</a></li>
          <li><a href="<?php echo $report_sale_return; ?>">عائدات</a></li>
          <li><a href="<?php echo $report_sale_coupon; ?>">Coupons</a></li>
        </ul>
      </li>
      <li><a class="parent">منتجات</a>
        <ul>
          <li><a href="<?php echo $report_product_viewed; ?>">مشاهدة التجديثات</a></li>
          <li><a href="<?php echo $report_product_purchased; ?>">اتمام شراء</a></li>
        </ul>
      </li>
      <li><a class="parent">الزبائن</a>
        <ul>
          <li><a href="<?php echo $report_customer_online; ?>">العملاء عبر الإنترنت</a></li>
          <li><a href="<?php echo $report_customer_activity; ?>">نشاط العميل</a></li>
          <li><a href="<?php echo $report_customer_order; ?>">الطلبات</a></li>
          <li><a href="<?php echo $report_customer_reward; ?>">نقاط مكافأة</a></li>
          <li><a href="<?php echo $report_customer_credit; ?>">ائتمان</a></li>
        </ul>
      </li>
      <li><a class="parent">تسويق</a>
        <ul>
          <li><a href="<?php echo $report_marketing; ?>">تسويق</a></li>
          <li><a href="<?php echo $report_affiliate; ?>">الشركات التابعة</a></li>
          <li><a href="<?php echo $report_affiliate_activity; ?>">النشاط التابع</a></li>
        </ul>
      </li>
    </ul>
  </li>
</ul>
