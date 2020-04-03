# 基于 LEX 和 YACC 的简单计算器

## 0 需求

某软件项目现需要一个简单的整数计算器：

1. 该计算器有26个寄存器(分别用 a ~ z命名)，各自保存一个数值。

2. 支持的算术运算(表达式)：

   * 算术运算：+ - * / %，其中+, - 既有一元运算，也有二元运算；

   * 整数的位运算：  &（按位与），  | （按位或）

   * 赋值运算： =，用于为指定寄存器赋值，如 a=1+2 就是让名为a的寄存器存储3。

3. 如果表达式为赋值，则仅保存数值到指定寄存器；否则打印表达式的值。

    * 如处理完表达式 a=1+2 时，仅仅将3 存放到寄存器a中，屏幕上不显示任何文本。

4. 若一个整数数值由0开始，则认为是八进制数，否则为十进制数。

## 1 文法

```plain
list → ε| list  stat  '\n'
stat → expr
      | LETTER  '='  expr
expr → '('  expr  ')'  
  | expr  '+'  expr
  | expr  '-'  expr
  | expr  '*'  expr
  | expr  '/'  expr
  | expr  '%'  expr
  | expr  '&'  expr
  | expr  '|'  expr
  | '-'  expr
  | LETTER
  | number
number → DIGIT
        | number  DIGIT

```
