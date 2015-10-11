var Script = function () {

    //morris chart

    $(function () {
      // data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type
      var tax_data = [
           {"period": "2011 Q3", "licensed": 3407, "sorned": 660},
           {"period": "2011 Q2", "licensed": 3351, "sorned": 629},
           {"period": "2011 Q1", "licensed": 3269, "sorned": 618},
           {"period": "2010 Q4", "licensed": 3246, "sorned": 661},
           {"period": "2009 Q4", "licensed": 3171, "sorned": 676},
           {"period": "2008 Q4", "licensed": 3155, "sorned": 681},
           {"period": "2007 Q4", "licensed": 3226, "sorned": 620},
           {"period": "2006 Q4", "licensed": 3245, "sorned": null},
           {"period": "2005 Q4", "licensed": 3289, "sorned": null}
      ];

      Morris.Donut({
        element: 'hero-donut1',
        data: [
          {label: 'Male', value: 25 },
          {label: 'Female', value: 40 }
        ],
          colors: ['#ff9231', '#ffc550'],
        formatter: function (y) { return y + "%" }
      });

      Morris.Bar({
        element: 'hero-bar',
        data: [
          {device: "10's", geekbench: 236},
          {device: "20's", geekbench: 437},
          {device: "30's", geekbench: 475},
          {device: "40's", geekbench: 280},
          {device: "50's", geekbench: 155},
          {device: "60's", geekbench: 90},
          {device: "70's", geekbench: 15}
        ],
        xkey: 'device',
        ykeys: ['geekbench'],
        labels: ['Geekbench'],
        barRatio: 0.4,
        xLabelAngle: 35,
        hideHover: 'auto',
        barColors: ['#7cded5']
      });

      Morris.Donut({
        element: 'hero-donut2',
        data: [
          {label: 'Author', value: 25 },
          {label: 'General', value: 40 }
        ],
        colors: ['#83389b', '#cca5d7'],
        formatter: function (y) { return y + "%" }
      });


      $('.code-example').each(function (index, el) {
        eval($(el).text());
      });
    });
}();
