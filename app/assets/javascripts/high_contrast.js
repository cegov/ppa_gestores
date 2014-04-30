var HighContrast = {
	isOn: false,
	objDefaults: {
		initTarget: "#high-contrast-tgt",
		backgroundTargets: ['header', '#accessibility_menu', "#logo_bar", 
			"#page .sidebar-nav", "#nav_services .navbar-inner", "body", 
			"footer", "footer #government_links"
		]
	}, 
	init: function(){
		this.initAccessibilityButton();			
	},
	initAccessibilityButton: function(){
		// toggle flag
		
		
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
			
			console.log("hello!");
		});
	}
	
};