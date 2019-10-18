rails c

ArraySortingService.new(task_1_array: ["L", "L/P", "S", "M", "M/P", "S", "S/P", "XL", "XL/P", "XS", "XS/P"], task_2_array: ["0", "2", "8", "6", "4", "4", "000", "00"]).call

params = {
   "url":"https://example.com/dress/435?color=041",
   "product_sku":"435",
   "product_name":"Sundry Fabian Dress",
   "article_sku":"435_041",
   "related_sku":["324_021","892_15"],
   "article_name":"NAVY",
   "price":"$148.00",
   "photos":[
      {
         "url":"https://example.com/images/435_1.jpg",
      },
      {
         "url":"https://example.com/images/435_2.jpg",
      },
      {
         "url":"https://example.com/images/435_3.jpg",
      }
   ],
   "sizes":[
      {
         "size_sku":"435_041_4",
         "name":"XS",
         "available":true
      },
      {
         "size_sku":"435_041_5",
         "name":"S",
         "available":true
      },
      {
         "size_sku":"435_041_6",
         "name":"M",
         "available":true
      },
      {
         "size_sku":"435_041_7",
         "name":"L",
         "available":false
      },
      {
         "size_sku":"435_041_8",
         "name":"XL",
         "available":false
      }
   ]
}

Products::Factory.new(params).call
