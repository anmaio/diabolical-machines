// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "../../GridHelper.sol";
import "../../CommonSVG.sol";

library NosesCSS4 {
  string internal constant PART = "ckground-color:#5294ab} #paths-stroke-cols-sp_84 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5193aa} #paths-stroke-cols-sp_85 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5192aa} #paths-stroke-cols-sp_86 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5091a9} #paths-stroke-cols-sp_87 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5090a8} #paths-stroke-cols-sp_88 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4f8fa7} #paths-stroke-cols-sp_89 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4f8ea6} #paths-stroke-cols-sp_90 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4e8da5} #paths-stroke-cols-sp_91 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4e8ca5} #paths-stroke-cols-sp_92 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4d8ba4} #paths-stroke-cols-sp_93 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4d8aa3} #paths-stroke-cols-sp_94 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4d89a2} #paths-stroke-cols-sp_95 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4c88a1} #paths-stroke-cols-sp_96 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4c87a0} #paths-stroke-cols-sp_97 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4b86a0} #paths-stroke-cols-sp_98 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4b859f} #paths-stroke-cols-sp_99 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4a849e} #paths-stroke-cols-sp_100 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4a839d} #paths-stroke-cols-sp_101 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#49829c} #paths-stroke-cols-sp_102 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#49819b} #paths-stroke-cols-sp_103 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#48809b} #paths-stroke-cols-sp_104 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#487f9a} #paths-stroke-cols-sp_105 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#477e99} #paths-stroke-cols-sp_106 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#477d98} #paths-stroke-cols-sp_107 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#467c97} #paths-stroke-cols-sp_108 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#467b96} #paths-stroke-cols-sp_109 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#457a96} #paths-stroke-cols-sp_110 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#457995} #paths-stroke-cols-sp_111 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#447894} #paths-stroke-cols-sp_112 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#447793} #paths-stroke-cols-sp_113 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#3d4676} #paths-stroke-cols-sp_114 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#3d4777} #paths-stroke-cols-sp_115 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#3e4878} #paths-stroke-cols-sp_116 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#3e4978} #paths-stroke-cols-sp_117 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#3e4a79} #paths-stroke-cols-sp_118 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#3f4b7a} #paths-stroke-cols-sp_119 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#3f4c7b} #paths-stroke-cols-sp_120 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#404d7b} #paths-stroke-cols-sp_121 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#404e7c} #paths-stroke-cols-sp_122 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#404f7d} #paths-stroke-cols-sp_123 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#41507e} #paths-stroke-cols-sp_124 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#41517e} #paths-stroke-cols-sp_125 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#41527f} #paths-stroke-cols-sp_126 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#425380} #paths-stroke-cols-sp_127 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#425481} #paths-stroke-cols-sp_128 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#435581} #paths-stroke-cols-sp_129 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#435682} #paths-stroke-cols-sp_130 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#435783} #paths-stroke-cols-sp_131 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#445884} #paths-stroke-cols-sp_132 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#445985} #paths-stroke-cols-sp_133 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#445a85} #paths-stroke-cols-sp_134 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#455b86} #paths-stroke-cols-sp_135 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#455c87} #paths-stroke-cols-sp_136 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#465d88} #paths-stroke-cols-sp_137 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#465e88} #paths-stroke-cols-sp_138 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#465f89} #paths-stroke-cols-sp_139 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#47608a} #paths-stroke-cols-sp_140 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#47618b} #paths-stroke-cols-sp_141 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#47628b} #paths-stroke-cols-sp_142 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#48638c} #paths-stroke-cols-sp_143 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#48648d} #paths-stroke-cols-sp_144 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#49658e} #paths-stroke-cols-sp_145 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#49668f} #paths-stroke-cols-sp_146 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#49678f} #paths-stroke-cols-sp_147 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4a6890} #paths-stroke-cols-sp_148 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4a6991} #paths-stroke-cols-sp_149 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4a6a92} #paths-stroke-cols-sp_150 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4b6b92} #paths-stroke-cols-sp_151 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4b6c93} #paths-stroke-cols-sp_152 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4c6d94} #paths-stroke-cols-sp_153 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4c6e95} #paths-stroke-cols-sp_154 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4c6f95} #paths-stroke-cols-sp_155 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4d7096} #paths-stroke-cols-sp_156 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4d7197} #paths-stroke-cols-sp_157 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4d7298} #paths-stroke-cols-sp_158 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4e7398} #paths-stroke-cols-sp_159 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4e7499} #paths-stroke-cols-sp_160 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4f759a} #paths-stroke-cols-sp_161 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4f769b} #paths-stroke-cols-sp_162 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#4f779c} #paths-stroke-cols-sp_163 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#50789c} #paths-stroke-cols-sp_164 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#50799d} #paths-stroke-cols-sp_165 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#507a9e} #paths-stroke-cols-sp_166 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#517b9f} #paths-stroke-cols-sp_167 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#517c9f} #paths-stroke-cols-sp_168 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#527da0} #paths-stroke-cols-sp_169 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#527ea1} #paths-stroke-cols-sp_170 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#527fa2} #paths-stroke-cols-sp_171 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5380a2} #paths-stroke-cols-sp_172 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5381a3} #paths-stroke-cols-sp_173 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5382a4} #paths-stroke-cols-sp_174 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5483a5} #paths-stroke-cols-sp_175 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5484a5} #paths-stroke-cols-sp_176 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5585a6} #paths-stroke-cols-sp_177 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5586a7} #paths-stroke-cols-sp_178 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5587a8} #paths-stroke-cols-sp_179 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5688a9} #paths-stroke-cols-sp_180 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5689a9} #paths-stroke-cols-sp_181 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#568aaa} #paths-stroke-cols-sp_182 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#578bab} #paths-stroke-cols-sp_183 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#578cac} #paths-stroke-cols-sp_184 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#588dac} #paths-stroke-cols-sp_185 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#588ead} #paths-stroke-cols-sp_186 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#588fae} #paths-stroke-cols-sp_187 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5990af} #paths-stroke-cols-sp_188 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5991af} #paths-stroke-cols-sp_189 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5992b0} #paths-stroke-cols-sp_190 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5a93b1} #paths-stroke-cols-sp_191 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5a94b2} #paths-stroke-cols-sp_192 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5a95b2} #paths-stroke-cols-sp_193 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5b96b3} #paths-stroke-cols-sp_194 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5b97b4} #paths-stroke-cols-sp_195 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5c98b5} #paths-stroke-cols-sp_196 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5c99b6} #paths-stroke-cols-sp_197 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5c9ab6} #paths-stroke-cols-sp_198 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5d9bb7} #paths-stroke-cols-sp_199 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5d9cb8} #paths-stroke-cols-sp_200 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5d9db9} #paths-stroke-cols-sp_201 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5e9eb9} #paths-stroke-cols-sp_202 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5e9fba} #paths-stroke-cols-sp_203 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5fa0bb} #paths-stroke-cols-sp_204 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5fa1bc} #paths-stroke-cols-sp_205 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#5fa2bc} #paths-stroke-cols-sp_206 { min-width: 15px; min-height:15px; padding:0.3rem; display: inline-block; color: white; background-color:#60a3bd} #paths-stroke-";
}