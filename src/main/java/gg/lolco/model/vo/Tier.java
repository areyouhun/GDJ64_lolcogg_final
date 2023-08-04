package gg.lolco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Tier {
   
   private int tierNo;
   private String email;
   private TierRules tierRulesNo;
   
}