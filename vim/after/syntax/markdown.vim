" frontmatter highlighting
unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml

" show hard line breaks
syntax match markdownHardLineBreak /\s\s\+$/ conceal cchar=∫
setlocal conceallevel=1
