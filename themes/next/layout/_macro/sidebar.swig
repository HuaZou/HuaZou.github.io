{% macro render(display_toc) %}
  <div class="toggle sidebar-toggle">
    <span class="toggle-line toggle-line-first"></span>
    <span class="toggle-line toggle-line-middle"></span>
    <span class="toggle-line toggle-line-last"></span>
  </div>

  <aside class="sidebar">
    <div class="sidebar-inner">
      {%- set display_toc = page.toc.enable and display_toc %}
      {%- if display_toc %}
        {%- set toc = toc(page.content, { class: "nav", list_number: page.toc.number, max_depth: page.toc.max_depth }) %}
        {%- set display_toc = toc.length > 1 and display_toc %}
      {%- endif %}

      <ul class="sidebar-nav motion-element">
        <li class="sidebar-nav-toc">
          {{ __('sidebar.toc') }}
        </li>
        <li class="sidebar-nav-overview">
          {{ __('sidebar.overview') }}
        </li>
      </ul>

      <!--noindex-->
      <div class="post-toc-wrap sidebar-panel">
        {%- if display_toc %}
          <div class="post-toc motion-element">{{ toc }}</div>
        {%- endif %}
      </div>
      <!--/noindex-->

      <div class="site-overview-wrap sidebar-panel">
        {{ partial('_partials/sidebar/site-overview.swig', {}, {cache: theme.cache.enable}) }}

        {{- next_inject('sidebar') }}
      </div>

	{# Blogroll #}
	  {% if theme.links %}
		  <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.links_layout | default('inline') }}">
			<div class="links-of-blogroll-title">
			  <i class="fa  fa-fw fa-{{ theme.links_icon | default('globe') | lower }}"></i>
			  {{ theme.links_title }}&nbsp;
			  <i class="fa  fa-fw fa-{{ theme.links_icon | default('globe') | lower }}"></i>
			</div>
			<ul class="links-of-blogroll-list">
			  {% for name, link in theme.links %}
				<li class="links-of-blogroll-item">
				  <a href="{{ link }}" title="{{ name }}" target="_blank">{{ name }}</a>
				</li>
			  {% endfor %}
			</ul>
			{% include '../_custom/sidebar.swig' %}
		  </div>
	  {% endif %}
	  
	  
	  {% if theme.recent_posts %}
		  <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.recent_posts_layout  }}">
			<div class="links-of-blogroll-title">
			  <!-- modify icon to fire by szw -->
			  <i class="fa fa-history fa-{{ theme.recent_posts_icon | lower }}" aria-hidden="true"></i>
			  {{ theme.recent_posts_title }}
			</div>
			<ul class="links-of-blogroll-list">
			  {% set posts = site.posts.sort('-date') %}
			  {% for post in posts.slice('0', '5') %}
				<li>
				  <a href="{{ url_for(post.path) }}" title="{{ post.title }}" target="_blank">{{ post.title }}</a>
				</li>
			  {% endfor %}
			</ul>
		  </div>
	  {% endif %}
	
	
	  {% include '../_custom/clock.swig' %}
	  
	  
      {%- if theme.back2top.enable and theme.back2top.sidebar %}
        <div class="back-to-top motion-element">
          <i class="fa fa-arrow-up"></i>
          <span>0%</span>
        </div>
      {%- endif %}

    </div>
  </aside>
  <div id="sidebar-dimmer"></div>
{% endmacro %}
