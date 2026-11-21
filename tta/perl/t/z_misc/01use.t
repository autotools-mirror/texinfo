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
                               Texinfo::TreeElement::new({'text' => 'aaaa'}),
                            ]
             }),
             Texinfo::TreeElement::new({ 'text' => ' ' }),
             Texinfo::TreeElement::new({ 'type' => 'bracketed_arg',
               'contents' => [
                               Texinfo::TreeElement::new({'text' => 'xx'}),
                               Texinfo::TreeElement::new({'cmdname' => 'b',
                                'contents' => [
                                      Texinfo::TreeElement::new({
                                              'type' => 'brace_container',
                                              'contents' => [
                                  Texinfo::TreeElement::new({ 'text' => 'rr' })
                                                         ]
                                            })
                                          ]
                               })
                            ]
             }),
             Texinfo::TreeElement::new({'text' => ' ccc'}),
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
                             Texinfo::TreeElement::new({ 'text' => 'title' }),
                             Texinfo::TreeElement::new({ 'cmdname' => 'verb',
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
                             Texinfo::TreeElement::new({ 'cmdname' => '@'}),
                             Texinfo::TreeElement::new({ 'text' => ".\n"}),
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
                                                 'extra' => {'cell_number' => 1,},
                                                 'contents' => [
                                   Texinfo::TreeElement::new({'text' => " \n" }) ]
                                               })
                                             ]
                             }),
                           ]
           }),
           Texinfo::TreeElement::new({
             'cmdname' => 'end',
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
                      'text' => 'multitable'
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

