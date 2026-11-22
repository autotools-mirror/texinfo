use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'enumerate_letters'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@enumerate C208 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:c}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l4
   |EXTRA
   |item_number:{3}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l5
   |EXTRA
   |item_number:{4}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l6
   |EXTRA
   |item_number:{5}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l7
   |EXTRA
   |item_number:{6}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l8
   |EXTRA
   |item_number:{7}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l9
   |EXTRA
   |item_number:{8}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l10
   |EXTRA
   |item_number:{9}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l11
   |EXTRA
   |item_number:{10}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l12
   |EXTRA
   |item_number:{11}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l13
   |EXTRA
   |item_number:{12}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l14
   |EXTRA
   |item_number:{13}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l15
   |EXTRA
   |item_number:{14}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l16
   |EXTRA
   |item_number:{15}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l17
   |EXTRA
   |item_number:{16}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l18
   |EXTRA
   |item_number:{17}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l19
   |EXTRA
   |item_number:{18}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l20
   |EXTRA
   |item_number:{19}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l21
   |EXTRA
   |item_number:{20}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l22
   |EXTRA
   |item_number:{21}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l23
   |EXTRA
   |item_number:{22}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l24
   |EXTRA
   |item_number:{23}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l25
   |EXTRA
   |item_number:{24}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l26
   |EXTRA
   |item_number:{25}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l27
   |EXTRA
   |item_number:{26}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l28
   |EXTRA
   |item_number:{27}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l29
   |EXTRA
   |item_number:{28}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l30
   |EXTRA
   |item_number:{29}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l31
   |EXTRA
   |item_number:{30}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l32
   |EXTRA
   |item_number:{31}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l33
   |EXTRA
   |item_number:{32}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l34
   |EXTRA
   |item_number:{33}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l35
   |EXTRA
   |item_number:{34}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l36
   |EXTRA
   |item_number:{35}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l37
   |EXTRA
   |item_number:{36}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l38
   |EXTRA
   |item_number:{37}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l39
   |EXTRA
   |item_number:{38}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l40
   |EXTRA
   |item_number:{39}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l41
   |EXTRA
   |item_number:{40}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l42
   |EXTRA
   |item_number:{41}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l43
   |EXTRA
   |item_number:{42}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l44
   |EXTRA
   |item_number:{43}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l45
   |EXTRA
   |item_number:{44}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l46
   |EXTRA
   |item_number:{45}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l47
   |EXTRA
   |item_number:{46}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l48
   |EXTRA
   |item_number:{47}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l49
   |EXTRA
   |item_number:{48}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l50
   |EXTRA
   |item_number:{49}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l51
   |EXTRA
   |item_number:{50}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l52
   |EXTRA
   |item_number:{51}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l53
   |EXTRA
   |item_number:{52}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l54
   |EXTRA
   |item_number:{53}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l55
   |EXTRA
   |item_number:{54}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l56
   |EXTRA
   |item_number:{55}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l57
   |EXTRA
   |item_number:{56}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l58
   |EXTRA
   |item_number:{57}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l59
   |EXTRA
   |item_number:{58}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l60
   |EXTRA
   |item_number:{59}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l61
   |EXTRA
   |item_number:{60}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l62
   |EXTRA
   |item_number:{61}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l63
   |EXTRA
   |item_number:{62}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l64
   |EXTRA
   |item_number:{63}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l65
   |EXTRA
   |item_number:{64}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l66
   |EXTRA
   |item_number:{65}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l67
   |EXTRA
   |item_number:{66}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l68
   |EXTRA
   |item_number:{67}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l69
   |EXTRA
   |item_number:{68}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l70
   |EXTRA
   |item_number:{69}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l71
   |EXTRA
   |item_number:{70}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l72
   |EXTRA
   |item_number:{71}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l73
   |EXTRA
   |item_number:{72}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l74
   |EXTRA
   |item_number:{73}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l75
   |EXTRA
   |item_number:{74}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l76
   |EXTRA
   |item_number:{75}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l77
   |EXTRA
   |item_number:{76}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l78
   |EXTRA
   |item_number:{77}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l79
   |EXTRA
   |item_number:{78}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l80
   |EXTRA
   |item_number:{79}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l81
   |EXTRA
   |item_number:{80}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l82
   |EXTRA
   |item_number:{81}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l83
   |EXTRA
   |item_number:{82}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l84
   |EXTRA
   |item_number:{83}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l85
   |EXTRA
   |item_number:{84}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l86
   |EXTRA
   |item_number:{85}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l87
   |EXTRA
   |item_number:{86}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l88
   |EXTRA
   |item_number:{87}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l89
   |EXTRA
   |item_number:{88}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l90
   |EXTRA
   |item_number:{89}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l91
   |EXTRA
   |item_number:{90}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l92
   |EXTRA
   |item_number:{91}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l93
   |EXTRA
   |item_number:{92}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l94
   |EXTRA
   |item_number:{93}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l95
   |EXTRA
   |item_number:{94}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l96
   |EXTRA
   |item_number:{95}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l97
   |EXTRA
   |item_number:{96}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l98
   |EXTRA
   |item_number:{97}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l99
   |EXTRA
   |item_number:{98}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l100
   |EXTRA
   |item_number:{99}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l101
   |EXTRA
   |item_number:{100}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l102
   |EXTRA
   |item_number:{101}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l103
   |EXTRA
   |item_number:{102}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l104
   |EXTRA
   |item_number:{103}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l105
   |EXTRA
   |item_number:{104}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l106
   |EXTRA
   |item_number:{105}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l107
   |EXTRA
   |item_number:{106}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l108
   |EXTRA
   |item_number:{107}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l109
   |EXTRA
   |item_number:{108}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l110
   |EXTRA
   |item_number:{109}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l111
   |EXTRA
   |item_number:{110}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l112
   |EXTRA
   |item_number:{111}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l113
   |EXTRA
   |item_number:{112}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l114
   |EXTRA
   |item_number:{113}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l115
   |EXTRA
   |item_number:{114}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l116
   |EXTRA
   |item_number:{115}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l117
   |EXTRA
   |item_number:{116}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l118
   |EXTRA
   |item_number:{117}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l119
   |EXTRA
   |item_number:{118}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l120
   |EXTRA
   |item_number:{119}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l121
   |EXTRA
   |item_number:{120}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l122
   |EXTRA
   |item_number:{121}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l123
   |EXTRA
   |item_number:{122}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l124
   |EXTRA
   |item_number:{123}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l125
   |EXTRA
   |item_number:{124}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l126
   |EXTRA
   |item_number:{125}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l127
   |EXTRA
   |item_number:{126}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l128
   |EXTRA
   |item_number:{127}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l129
   |EXTRA
   |item_number:{128}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l130
   |EXTRA
   |item_number:{129}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l131
   |EXTRA
   |item_number:{130}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l132
   |EXTRA
   |item_number:{131}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l133
   |EXTRA
   |item_number:{132}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l134
   |EXTRA
   |item_number:{133}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l135
   |EXTRA
   |item_number:{134}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l136
   |EXTRA
   |item_number:{135}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l137
   |EXTRA
   |item_number:{136}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l138
   |EXTRA
   |item_number:{137}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l139
   |EXTRA
   |item_number:{138}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l140
   |EXTRA
   |item_number:{139}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l141
   |EXTRA
   |item_number:{140}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l142
   |EXTRA
   |item_number:{141}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l143
   |EXTRA
   |item_number:{142}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l144
   |EXTRA
   |item_number:{143}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l145
   |EXTRA
   |item_number:{144}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l146
   |EXTRA
   |item_number:{145}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l147
   |EXTRA
   |item_number:{146}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l148
   |EXTRA
   |item_number:{147}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l149
   |EXTRA
   |item_number:{148}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l150
   |EXTRA
   |item_number:{149}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l151
   |EXTRA
   |item_number:{150}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l152
   |EXTRA
   |item_number:{151}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l153
   |EXTRA
   |item_number:{152}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l154
   |EXTRA
   |item_number:{153}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l155
   |EXTRA
   |item_number:{154}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l156
   |EXTRA
   |item_number:{155}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l157
   |EXTRA
   |item_number:{156}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l158
   |EXTRA
   |item_number:{157}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l159
   |EXTRA
   |item_number:{158}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l160
   |EXTRA
   |item_number:{159}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l161
   |EXTRA
   |item_number:{160}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l162
   |EXTRA
   |item_number:{161}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l163
   |EXTRA
   |item_number:{162}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l164
   |EXTRA
   |item_number:{163}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l165
   |EXTRA
   |item_number:{164}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l166
   |EXTRA
   |item_number:{165}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l167
   |EXTRA
   |item_number:{166}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l168
   |EXTRA
   |item_number:{167}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l169
   |EXTRA
   |item_number:{168}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l170
   |EXTRA
   |item_number:{169}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l171
   |EXTRA
   |item_number:{170}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l172
   |EXTRA
   |item_number:{171}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l173
   |EXTRA
   |item_number:{172}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l174
   |EXTRA
   |item_number:{173}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l175
   |EXTRA
   |item_number:{174}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l176
   |EXTRA
   |item_number:{175}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l177
   |EXTRA
   |item_number:{176}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l178
   |EXTRA
   |item_number:{177}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l179
   |EXTRA
   |item_number:{178}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l180
   |EXTRA
   |item_number:{179}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l181
   |EXTRA
   |item_number:{180}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l182
   |EXTRA
   |item_number:{181}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l183
   |EXTRA
   |item_number:{182}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l184
   |EXTRA
   |item_number:{183}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l185
   |EXTRA
   |item_number:{184}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l186
   |EXTRA
   |item_number:{185}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l187
   |EXTRA
   |item_number:{186}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l188
   |EXTRA
   |item_number:{187}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l189
   |EXTRA
   |item_number:{188}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l190
   |EXTRA
   |item_number:{189}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l191
   |EXTRA
   |item_number:{190}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l192
   |EXTRA
   |item_number:{191}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l193
   |EXTRA
   |item_number:{192}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l194
   |EXTRA
   |item_number:{193}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l195
   |EXTRA
   |item_number:{194}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l196
   |EXTRA
   |item_number:{195}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l197
   |EXTRA
   |item_number:{196}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l198
   |EXTRA
   |item_number:{197}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l199
   |EXTRA
   |item_number:{198}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l200
   |EXTRA
   |item_number:{199}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l201
   |EXTRA
   |item_number:{200}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l202
   |EXTRA
   |item_number:{201}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l203
   |EXTRA
   |item_number:{202}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l204
   |EXTRA
   |item_number:{203}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l205
   |EXTRA
   |item_number:{204}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l206
   |EXTRA
   |item_number:{205}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@item C2 l207
   |EXTRA
   |item_number:{206}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@end C1 l208
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
';


$result_texis{'enumerate_letters'} = '@enumerate c
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@item aaa
@end enumerate
';


$result_texts{'enumerate_letters'} = 'c. aaa
d. aaa
e. aaa
f. aaa
g. aaa
h. aaa
i. aaa
j. aaa
k. aaa
l. aaa
m. aaa
n. aaa
o. aaa
p. aaa
q. aaa
r. aaa
s. aaa
t. aaa
u. aaa
v. aaa
w. aaa
x. aaa
y. aaa
z. aaa
aa. aaa
ab. aaa
ac. aaa
ad. aaa
ae. aaa
af. aaa
ag. aaa
ah. aaa
ai. aaa
aj. aaa
ak. aaa
al. aaa
am. aaa
an. aaa
ao. aaa
ap. aaa
aq. aaa
ar. aaa
as. aaa
at. aaa
au. aaa
av. aaa
aw. aaa
ax. aaa
ay. aaa
az. aaa
ba. aaa
bb. aaa
bc. aaa
bd. aaa
be. aaa
bf. aaa
bg. aaa
bh. aaa
bi. aaa
bj. aaa
bk. aaa
bl. aaa
bm. aaa
bn. aaa
bo. aaa
bp. aaa
bq. aaa
br. aaa
bs. aaa
bt. aaa
bu. aaa
bv. aaa
bw. aaa
bx. aaa
by. aaa
bz. aaa
ca. aaa
cb. aaa
cc. aaa
cd. aaa
ce. aaa
cf. aaa
cg. aaa
ch. aaa
ci. aaa
cj. aaa
ck. aaa
cl. aaa
cm. aaa
cn. aaa
co. aaa
cp. aaa
cq. aaa
cr. aaa
cs. aaa
ct. aaa
cu. aaa
cv. aaa
cw. aaa
cx. aaa
cy. aaa
cz. aaa
da. aaa
db. aaa
dc. aaa
dd. aaa
de. aaa
df. aaa
dg. aaa
dh. aaa
di. aaa
dj. aaa
dk. aaa
dl. aaa
dm. aaa
dn. aaa
do. aaa
dp. aaa
dq. aaa
dr. aaa
ds. aaa
dt. aaa
du. aaa
dv. aaa
dw. aaa
dx. aaa
dy. aaa
dz. aaa
ea. aaa
eb. aaa
ec. aaa
ed. aaa
ee. aaa
ef. aaa
eg. aaa
eh. aaa
ei. aaa
ej. aaa
ek. aaa
el. aaa
em. aaa
en. aaa
eo. aaa
ep. aaa
eq. aaa
er. aaa
es. aaa
et. aaa
eu. aaa
ev. aaa
ew. aaa
ex. aaa
ey. aaa
ez. aaa
fa. aaa
fb. aaa
fc. aaa
fd. aaa
fe. aaa
ff. aaa
fg. aaa
fh. aaa
fi. aaa
fj. aaa
fk. aaa
fl. aaa
fm. aaa
fn. aaa
fo. aaa
fp. aaa
fq. aaa
fr. aaa
fs. aaa
ft. aaa
fu. aaa
fv. aaa
fw. aaa
fx. aaa
fy. aaa
fz. aaa
ga. aaa
gb. aaa
gc. aaa
gd. aaa
ge. aaa
gf. aaa
gg. aaa
gh. aaa
gi. aaa
gj. aaa
gk. aaa
gl. aaa
gm. aaa
gn. aaa
go. aaa
gp. aaa
gq. aaa
gr. aaa
gs. aaa
gt. aaa
gu. aaa
gv. aaa
gw. aaa
gx. aaa
gy. aaa
gz. aaa
';

$result_errors{'enumerate_letters'} = '';

$result_nodes_list{'enumerate_letters'} = '';

$result_sections_list{'enumerate_letters'} = '';

$result_sectioning_root{'enumerate_letters'} = '';

$result_headings_list{'enumerate_letters'} = '';


$result_converted{'plaintext'}->{'enumerate_letters'} = '  c. aaa
  d. aaa
  e. aaa
  f. aaa
  g. aaa
  h. aaa
  i. aaa
  j. aaa
  k. aaa
  l. aaa
  m. aaa
  n. aaa
  o. aaa
  p. aaa
  q. aaa
  r. aaa
  s. aaa
  t. aaa
  u. aaa
  v. aaa
  w. aaa
  x. aaa
  y. aaa
  z. aaa
  aa. aaa
  ab. aaa
  ac. aaa
  ad. aaa
  ae. aaa
  af. aaa
  ag. aaa
  ah. aaa
  ai. aaa
  aj. aaa
  ak. aaa
  al. aaa
  am. aaa
  an. aaa
  ao. aaa
  ap. aaa
  aq. aaa
  ar. aaa
  as. aaa
  at. aaa
  au. aaa
  av. aaa
  aw. aaa
  ax. aaa
  ay. aaa
  az. aaa
  ba. aaa
  bb. aaa
  bc. aaa
  bd. aaa
  be. aaa
  bf. aaa
  bg. aaa
  bh. aaa
  bi. aaa
  bj. aaa
  bk. aaa
  bl. aaa
  bm. aaa
  bn. aaa
  bo. aaa
  bp. aaa
  bq. aaa
  br. aaa
  bs. aaa
  bt. aaa
  bu. aaa
  bv. aaa
  bw. aaa
  bx. aaa
  by. aaa
  bz. aaa
  ca. aaa
  cb. aaa
  cc. aaa
  cd. aaa
  ce. aaa
  cf. aaa
  cg. aaa
  ch. aaa
  ci. aaa
  cj. aaa
  ck. aaa
  cl. aaa
  cm. aaa
  cn. aaa
  co. aaa
  cp. aaa
  cq. aaa
  cr. aaa
  cs. aaa
  ct. aaa
  cu. aaa
  cv. aaa
  cw. aaa
  cx. aaa
  cy. aaa
  cz. aaa
  da. aaa
  db. aaa
  dc. aaa
  dd. aaa
  de. aaa
  df. aaa
  dg. aaa
  dh. aaa
  di. aaa
  dj. aaa
  dk. aaa
  dl. aaa
  dm. aaa
  dn. aaa
  do. aaa
  dp. aaa
  dq. aaa
  dr. aaa
  ds. aaa
  dt. aaa
  du. aaa
  dv. aaa
  dw. aaa
  dx. aaa
  dy. aaa
  dz. aaa
  ea. aaa
  eb. aaa
  ec. aaa
  ed. aaa
  ee. aaa
  ef. aaa
  eg. aaa
  eh. aaa
  ei. aaa
  ej. aaa
  ek. aaa
  el. aaa
  em. aaa
  en. aaa
  eo. aaa
  ep. aaa
  eq. aaa
  er. aaa
  es. aaa
  et. aaa
  eu. aaa
  ev. aaa
  ew. aaa
  ex. aaa
  ey. aaa
  ez. aaa
  fa. aaa
  fb. aaa
  fc. aaa
  fd. aaa
  fe. aaa
  ff. aaa
  fg. aaa
  fh. aaa
  fi. aaa
  fj. aaa
  fk. aaa
  fl. aaa
  fm. aaa
  fn. aaa
  fo. aaa
  fp. aaa
  fq. aaa
  fr. aaa
  fs. aaa
  ft. aaa
  fu. aaa
  fv. aaa
  fw. aaa
  fx. aaa
  fy. aaa
  fz. aaa
  ga. aaa
  gb. aaa
  gc. aaa
  gd. aaa
  ge. aaa
  gf. aaa
  gg. aaa
  gh. aaa
  gi. aaa
  gj. aaa
  gk. aaa
  gl. aaa
  gm. aaa
  gn. aaa
  go. aaa
  gp. aaa
  gq. aaa
  gr. aaa
  gs. aaa
  gt. aaa
  gu. aaa
  gv. aaa
  gw. aaa
  gx. aaa
  gy. aaa
  gz. aaa
';


$result_converted{'html_text'}->{'enumerate_letters'} = '<ol class="enumerate" type="a" start="3">
<li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li><li> aaa
</li></ol>
';


$result_converted{'xml'}->{'enumerate_letters'} = '<enumerate first="c" endspaces=" "><enumeratefirst> c</enumeratefirst>
<listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem><listitem> <para>aaa
</para></listitem></enumerate>
';

1;
