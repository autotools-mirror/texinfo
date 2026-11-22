use strict;

use Test::More;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 3);

use Texinfo::TreeElement;

use Texinfo::Convert::Texinfo;

plan tests => 2;

ok(1, 'modules loading');

# Note that this tree is not necessarily updated when the tree elements
# change, so it generally uses obsolete constructs.
my $manual_tree =
  Texinfo::TreeElement::new({ 'cmdname' => 'multitable',
  'type' => 'normal_command',
  'extra' => { 'max_columns' => 3, },
  'contents' => [
     Texinfo::TreeElement::new({'type' => 'arguments_line',
      'contents' => [
        Texinfo::TreeElement::new({ 'type' => 'block_line_arg',
          'contents' => [
             Texinfo::TreeElement::new({'type' => 'spaces_before_argument',
                                        'text' => ' '}),
             Texinfo::TreeElement::new({ 'type' => 'bracketed_arg',
               'contents' => [
                               Texinfo::TreeElement::new({'text' => 'aaaa',
                                                          'type' => 'normal_text'}),
                            ]
             }),
             Texinfo::TreeElement::new({ 'text' => ' ', 'type' => 'normal_text'}),
             Texinfo::TreeElement::new({ 'type' => 'bracketed_arg',
               'contents' => [
                               Texinfo::TreeElement::new({'text' => 'xx',
                                                   'type' => 'normal_text'}),
                               Texinfo::TreeElement::new({'cmdname' => 'b',
                                'type' => 'normal_command',
                                'contents' => [
                                      Texinfo::TreeElement::new({
                                              'type' => 'brace_container',
                                              'contents' => [
                                  Texinfo::TreeElement::new({ 'text' => 'rr',
                                                              'type' => 'normal_text' })
                                                         ]
                                            })
                                          ]
                               })
                            ]
             }),
             Texinfo::TreeElement::new({'text' => ' ccc', 'type' => 'normal_text'}),
             Texinfo::TreeElement::new({'type' => 'spaces_after_argument',
                                        'text' => '
'
                                       }),
          ],
       }) ],
     }),
           Texinfo::TreeElement::new({ 'type' => 'before_item',
             'contents' => [
                             Texinfo::TreeElement::new({ 'type' => 'paragraph',
                               'contents' => [
                             Texinfo::TreeElement::new({ 'text' => 'title',
                                                        'type' => 'normal_text' }),
                             Texinfo::TreeElement::new({ 'cmdname' => 'verb',
                                                  'type' => 'normal_command',
                                                  'contents' => [
                                                    Texinfo::TreeElement::new({
                                                               'contents' => [
                                                     Texinfo::TreeElement::new({ 'text' => ':',
                                                                    'type' => 'verb_delimiter'}),
                                                                    # {
                                                     Texinfo::TreeElement::new({ 'text' => ' in verb } ',
                                                                    'type' => 'raw' }),
                                                     Texinfo::TreeElement::new({ 'text' => ':',
                                                                    'type' => 'verb_delimiter'}),
                                                                ],
                                                                'type' => 'brace_container',
                                                            }) ],
                                                }),
                             Texinfo::TreeElement::new({ 'cmdname' => '@',
                                                  'type' => 'normal_command'}),
                             Texinfo::TreeElement::new({ 'text' => ".\n",
                                                     'type' => 'normal_text'}),
                                             ]
                             })
                           ]
           }),
     Texinfo::TreeElement::new({
             'type' => 'multitable_body',
             'contents' => [
                             Texinfo::TreeElement::new({
                               'type' => 'row',
                               'extra' => {'row_number' => 1},
                               'contents' => [
                                               Texinfo::TreeElement::new({
                                                 'cmdname' => 'item',
                                                 'type' => 'normal_command',
                                                 'extra' => {'cell_number' => 1,},
                                                 'contents' => [
                                   Texinfo::TreeElement::new({'text' => " \n",
                                                     'type' => 'normal_text' }) ]
                                               })
                                             ]
                             }),
                           ]
           }),
           Texinfo::TreeElement::new({
             'cmdname' => 'end',
             'type' => 'normal_command',
             'extra' => {
                         'text_arg' => 'multitable',
                        },
             'contents' => [
                Texinfo::TreeElement::new({
                  'type' => 'line_arg',
                  'contents' => [
                    Texinfo::TreeElement::new({'type' => 'spaces_before_argument',
                                               'text' => ' '}),
                    Texinfo::TreeElement::new({
                      'text' => 'multitable', 'type' => 'normal_text'
                    }),
                    Texinfo::TreeElement::new({'type' => 'spaces_after_argument',
                                               'text' => '
'
                                              }),
                  ],
                })
              ],

           })
  ]
});

my $manual_tree_result = '@multitable {aaaa} {xx@b{rr}} ccc
title@verb{: in verb } :}@@.
@item 
@end multitable
';

is(Texinfo::Convert::Texinfo::convert_to_texinfo($manual_tree),
   $manual_tree_result, 'tree_to_texi on a manually written tree');

