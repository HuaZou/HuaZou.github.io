/* global hexo */
// Usage: {% fold µã»÷ÏÔ/ÒşÄÚÈİ %} Something {% endfold %}
function fold (args, content) {
  var text = args[0];
  if(!text) text = "µã»÷ÏÔ/Òş";
  return '<div><div class="fold_hider"><div class="close hider_title">' + text + '</div></div><div class="fold">\n' + hexo.render.renderSync({text: content, engine: 'markdown'}) + '\n</div></div>';
}
hexo.extend.tag.register('fold', fold, {ends: true});