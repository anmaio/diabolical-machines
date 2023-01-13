// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "../../GridHelper.sol";
import "../../CommonSVG.sol";

library NosesCSS2 {
  string internal constant PART = "wa-117 {background:#63abc3; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-118 {background:#5eadc1; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-119 {background:#5eadc0; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-120 {background:#4cb4ca; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-121 {background:#62aac3; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-122 {background:#62a9c2; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-123 {background:#5dacbf; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-124 {background:#62a8c1; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-125 {background:#5dabbe; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-126 {background:#5caabe; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-127 {background:#61a7c0; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-128 {background:#61a6c0; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-129 {background:#5ca9bd; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-130 {background:#60a5bf; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-131 {background:#5ba8bc; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-132 {background:#60a4be; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-133 {background:#5ba7bb; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-134 {background:#60a3bd; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-135 {background:#5aa6ba; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-136 {background:#5fa2bc; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-137 {background:#5aa5b9; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-138 {background:#5fa1bc; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-139 {background:#59a4b9; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-140 {background:#5fa0bb; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-141 {background:#59a3b8; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-142 {background:#5e9fba; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-143 {background:#58a2b7; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-144 {background:#30b4c3; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-145 {background:#5e9eb9; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-146 {background:#58a1b6; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-147 {background:#5d9db9; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-148 {background:#57a0b5; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-149 {background:#5d9cb8; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-150 {background:#579fb4; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-151 {background:#5d9bb7; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-152 {background:#569eb4; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-153 {background:#5c9ab6; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-154 {background:#569db3; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-155 {background:#5c99b6; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-156 {background:#5c98b5; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-157 {background:#559cb2; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-158 {background:#559bb1; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-159 {background:#5b97b4; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-160 {background:#559ab0; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-161 {background:#5b96b3; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-162 {background:#5499af; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-163 {background:#5a95b2; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-164 {background:#5498af; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-165 {background:#5a94b2; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-166 {background:#5a93b1; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-167 {background:#5397ae; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-168 {background:#5396ad; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-169 {background:#5992b0; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-170 {background:#5991af; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-171 {background:#5295ac; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-172 {background:#5990af; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-173 {background:#5294ab; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-174 {background:#588fae; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-175 {background:#5193aa; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-176 {background:#588ead; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-177 {background:#5192aa; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-178 {background:#588dac; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-179 {background:#5091a9; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-180 {background:#578cac; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-181 {background:#5090a8; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-182 {background:#1ba5c4; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-183 {background:#578bab; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-184 {background:#4f8fa7; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-185 {background:#568aaa; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-186 {background:#4f8ea6; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-187 {background:#5689a9; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-188 {background:#4e8da5; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-189 {background:#5688a9; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-190 {background:#4e8ca5; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-191 {background:#5587a8; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-192 {background:#4d8ba4; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-193 {background:#5586a7; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-194 {background:#4d8aa3; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-195 {background:#5585a6; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-196 {background:#9361bc; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-197 {background:#4d89a2; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-198 {background:#5484a5; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-199 {background:#4c88a1; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-200 {background:#5483a5; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-201 {background:#4c87a0; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-202 {background:#5382a4; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-203 {background:#4b86a0; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-204 {background:#5381a3; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-205 {background:#4b859f; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-206 {background:#5380a2; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-207 {background:#4a849e; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-208 {background:#527fa2; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-209 {background:#4a839d; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-210 {background:#527ea1; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-211 {background:#527da0; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-212 {background:#49829c; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-213 {background:#49819b; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-214 {background:#517c9f; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-215 {background:#517b9f; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-216 {background:#48809b; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-217 {background:#487f9a; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-218 {background:#507a9e; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-219 {background:#50799d; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-220 {background:#477e99; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-221 {background:#50789c; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-222 {background:#477d98; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-223 {background:#4f779c; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-224 {background:#467c97; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-225 {background:#4f769b; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-226 {background:#467b96; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-227 {background:#4f759a; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-228 {background:#457a96; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-229 {background:#2c84a3; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-230 {background:#4e7499; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-231 {background:#457995; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-232 {background:#4e7398; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-233 {background:#447894; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-234 {background:#4d7298; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-235 {background:#447793; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-236 {background:#4d7197; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-237 {background:#4d7096; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-238 {background:#4c6f95; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-239 {background:#4c6e95; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-240 {background:#4c6d94; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-241 {background:#4b6c93; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-242 {background:#4b6b92; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-243 {background:#4a6a92; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-244 {background:#4a6991; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-245 {background:#4a6890; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-246 {background:#49678f; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-247 {background:#49668f; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-248 {background:#49658e; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-249 {background:#48648d; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-250 {background:#48638c; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-251 {background:#47628b; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-252 {background:#47618b; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-253 {background:#47608a; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-254 {background:#465f89; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-255 {background:#465e88; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-256 {background:#465d88; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-257 {background:#455c87; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-258 {background:#455b86; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-259 {background:#206c8e; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-260 {background:#445a85; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-261 {background:#445985; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-262 {background:#445884; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-263 {background:#435783; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-264 {background:#435682; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-265 {background:#435581; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-266 {background:#425481; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-267 {background:#425380; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-268 {background:#41527f; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-269 {background:#41517e; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-270 {background:#41507e; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-271 {background:#404f7d; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-272 {background:#404e7c; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-273 {background:#404d7b; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-274 {background:#3f4c7b; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-275 {background:#3f4b7a; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-276 {background:#3e4a79; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-277 {background:#3e4978; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-278 {background:#3e4878; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-279 {background:#3d4777; color:#FFFFFF; position: relative; display:inline-block; padding:1rem;} #col-swa-280 {background:#e10613; color:#FFFFFF; position: relative; display:inline-block; pa";

  function getPart() external pure returns (string memory) {
    return PART;
  }
}