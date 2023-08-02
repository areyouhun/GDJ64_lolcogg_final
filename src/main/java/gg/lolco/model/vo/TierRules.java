package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class TierRules {

   private int tierRulesNo;
   private String tierRulesName;
   private int tierRulesExpState;
   private int tierRulesExpEnd;
   private String tierRulesImage;
   

}