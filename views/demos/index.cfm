<cfoutput>
	<h3>Demos</h3>
	<div class="demoItems">
		<cfloop query="local.qDemos">
			<script type="text/javascript">
			$(document).ready(function(){
				var sData = {target: '##demo_item_description_#currentrow#_#local.id#', closeBtn: '##close_btn_#currentrow#_#local.id#'};
				$('##demo_item_header_#currentrow#_#local.id#').data('item', sData);
				//$('##close_btn_#currentrow#_#local.id#').data('item', sData);
			});
			</script>
			<div id="item_#currentrow#_#local.id#" class="demo_item">
				<div>
					<img id="close_btn_#currentrow#_#local.id#" class="closeBtn hidden" src="/images/close.png" height="14" width="14"/>
					<span id="demo_item_header_#currentrow#_#local.id#" class="demo_item_header">#name#</div>
				</div>
				<div id="demo_item_description_#currentrow#_#local.id#" class="hidden demo_item_description">
					<div>#description#</div>
					<div><a href="#url#" target="_blank">View Demo</a></div>
				</div>
			</div>
		</cfloop>
	</div>
</cfoutput>

<script type="text/javascript">
$(document).ready(function(){
	$('.demo_item_header').click(function(){
		var myTarget = $(this).data('item').target;
		var myCloseBtn = $(this).data('item').closeBtn;
		$(myTarget).animate({height: 'show', opacity: 'show'},500,null,function(){
			$(myCloseBtn).animate({opacity: 'show'},250);
		});
		
		$(myCloseBtn).click(function(){
			$(myTarget).animate({height: 'hide', opacity: 'hide'},500,null,function(){
				$(myCloseBtn).animate({opacity: 'hide'},250);
			});
		});
	});
});
</script>