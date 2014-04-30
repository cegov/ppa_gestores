// This class is used to define how elements will behave in high contrast mode
// to define the intended look do so in the file bootstrap_and_overrides.css.less
var HighContrast = {
	isOn: false,
	objDefaults: {
		initTarget: "#high-contrast-tgt",
		
		/**********************************************************************/
		// ADD TO THE LIST PAGE ELEMENTS THAT SHOULD HAVE THEIR COLOR CHANGED IN 
		// HIGH CONTRAST MODE
		backgroundTargets: ['header', '#accessibility_menu', "#logo_bar", 
			"#page .sidebar-nav", "#nav_services .navbar-inner", "body", 
			"footer", "footer #government_links"
		]
		/**********************************************************************/
	}, 
	init: function(){
		this.initAccessibilityButton();			
	},
	initAccessibilityButton: function(){	
		$(HighContrast.objDefaults.initTarget).on('click', function(){
			if(HighContrast.isOn == false){
				HighContrast.isOn = true;
				$.each(HighContrast.objDefaults.backgroundTargets, function( index, idOrClassOfTheElement ) {
					$(idOrClassOfTheElement).addClass("high-contrast");
				});
				
			}
			else {
				HighContrast.isOn = false;				
				$.each(HighContrast.objDefaults.backgroundTargets, function( index, idOrClassOfTheElement ) {
					$(idOrClassOfTheElement).removeClass("high-contrast");
				});
			}			
		});
	}
	
};