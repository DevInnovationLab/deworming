This report was created by the Stata command iesave (version 7.2). Read more about this command and the purpose of this report on https://dimewiki.worldbank.org/iesave

- **Number of observations:** 34
- **Number of variables:** 100
- **ID variable(s):** trial
- **.dta version used:** 14
- **Data signature:** 34:100(56486):1607896381:2832813945
- **Last saved by:** User info withheld, see option userinfo in command iesave.
- **Last saved at:** 12:05:37 1 Sep 2023

## Variable type: String

| Name | Label | Type | Complete obs | Number of levels |
|---|---|---|---|---|
| N | "type of randomized units = n'var't + n'var'c" | str11 | 34 | 2 |
| country | "" | str16 | 34 | 17 |
| drug | "Deworming drug diven at each dosage" | str63 | 34 | 10 |
| name | "Study name" | str41 | 34 | 28 |
| notes | "" | str134 | 34 | 22 |
| prevalence | "Worm infection prevalence" | str4 | 34 | 27 |
| trial | "Trial name" | str21 | 34 | 34 |

## Variable type: Continuous

| Name | Label | Type | Complete obs | Mean | Std Dev | p0 | p25 | p50 | p75 | p100 |
|---|---|---|---|---|---|---|---|---|---|---|
| TMSDGsampleh | "TMSDG's height sample" | byte | 34 | .2353 | .4306 | 0 | 0 | 0 | 0 | 1 |
| TMSDGsampleheight | "" | byte | 34 | .2353 | .4306 | 0 | 0 | 0 | 0 | 1 |
| TMSDGsamplehem | "TMSDG's hemoglobin sample" | byte | 34 | .2353 | .4306 | 0 | 0 | 0 | 0 | 1 |
| TMSDGsamplehemob | "" | byte | 34 | .2353 | .4306 | 0 | 0 | 0 | 0 | 1 |
| TMSDGsamplem | "TMSDG's MUAC sample" | byte | 34 | .1176 | .327 | 0 | 0 | 0 | 0 | 1 |
| TMSDGsamplemuac | "" | byte | 34 | .1176 | .327 | 0 | 0 | 0 | 0 | 1 |
| TMSDGsamplew | "TMSDG's weight sample" | byte | 34 | .3235 | .4749 | 0 | 0 | 0 | 1 | 1 |
| TMSDGsampleweight | "" | byte | 34 | .3235 | .4749 | 0 | 0 | 0 | 1 | 1 |
| doses | "Number of doses given prior to endline" | float | 34 | 3.706 | 3.296 | 2 | 2 | 2.75 | 4 | 20 |
| flag_sd | "Unconditional sd of (at least one) dependent variable cannot be obtained from s." | byte | 34 | .2647 | .4478 | 0 | 0 | 0 | 1 | 1 |
| lengthfu | "Longest length of follow-up (months)" | float | 34 | 13.95 | 9.932 | 3 | 9 | 12 | 14 | 60 |
| moreh | "Additional estimates on (raw) height" | byte | 34 | .4118 | .4996 | 0 | 0 | 0 | 1 | 1 |
| moreheight | "" | byte | 34 | .4118 | .4996 | 0 | 0 | 0 | 1 | 1 |
| morehem | "Additional estimates on hemoglobin" | byte | 34 | .1765 | .387 | 0 | 0 | 0 | 0 | 1 |
| morehemob | "" | byte | 34 | .1765 | .387 | 0 | 0 | 0 | 0 | 1 |
| morem | "Additional estimates on MUAC" | byte | 34 | .08824 | .2879 | 0 | 0 | 0 | 0 | 1 |
| moremuac | "" | byte | 34 | .08824 | .2879 | 0 | 0 | 0 | 0 | 1 |
| morew1 | "Additional estimates on (raw) weight incorporated in NBER paper" | byte | 34 | .3235 | .4749 | 0 | 0 | 0 | 1 | 1 |
| morew2 | "Additional estimates on (raw) weight not in NBER paper" | byte | 34 | .1471 | .3595 | 0 | 0 | 0 | 0 | 1 |
| moreweight | "" | byte | 34 | .4706 | .5066 | 0 | 0 | 0 | 1 | 1 |
| nheightc | "Number of observations in control group for height analysis" | int | 25 | 132 | 178.5 | 1 | 28 | 44 | 111 | 623 |
| nheightc2 | "Final number of observations control group for height analysis" | int | 22 | 150.7 | 183.5 | 4 | 37 | 55 | 298 | 623 |
| nheightc_c | "Number of observations in control group for height analysis from TMSDG" | int | 10 | 100.4 | 124.7 | 25 | 33 | 67.5 | 98 | 444 |
| nheightc_c2 | "Number of observations in control group for height analysis from TMDCG" | int | 16 | 139.1 | 185.9 | 25 | 38 | 55 | 104.5 | 623 |
| nheightt | "Number of observations in treatment group for height analysis" | int | 25 | 138.8 | 188.8 | 1 | 31 | 42 | 116 | 601 |
| nheightt2 | "Final number of observations in treatment group for height analysis" | int | 22 | 158.4 | 194.1 | 8 | 37 | 53 | 303 | 601 |
| nheightt_c | "Number of observations in treatment group for height analysis from TMSDG" | int | 10 | 117.4 | 172.9 | 25 | 37 | 66 | 100 | 601 |
| nheightt_c2 | "Number of observations in treatment group for height analysis from TMDCG" | int | 16 | 147.5 | 200.4 | 25 | 38 | 53 | 108 | 601 |
| nhemobc | "Number of observations in control group for hemoglobin analysis" | int | 15 | 148.8 | 172.9 | 1 | 36 | 56 | 293 | 572 |
| nhemobc2 | "Final number of observations control group for hemoglobin analysis" | int | 13 | 167.9 | 178.4 | 32 | 37 | 82 | 293 | 572 |
| nhemobc_c | "Number of observations in control group for hemoglobin analysis from TMSDG" | int | 9 | 192.3 | 237.8 | 32 | 37 | 82 | 162 | 726 |
| nhemobc_c2 | "Number of observations in control group for hemoglobin analysis from TMDCG" | int | 12 | 137.3 | 178.8 | 32 | 36.5 | 57.5 | 122 | 572 |
| nhemobt | "Number of observations in treatment group for hemoglobin analysis" | int | 15 | 159.3 | 191.9 | 1 | 37 | 63 | 293 | 601 |
| nhemobt2 | "Final number of observations in treatment group for hemoglobin analysis" | int | 13 | 178.8 | 199.2 | 34 | 38 | 79 | 293 | 601 |
| nhemobt_c | "Number of observations in treatment group for hemoglobin analysis from TMSDG" | int | 9 | 207.1 | 255.3 | 34 | 38 | 86 | 158 | 697 |
| nhemobt_c2 | "Number of observations in treatment group for hemoglobin analysis from TMDCG" | int | 12 | 148.8 | 199.8 | 34 | 37.5 | 65.5 | 122 | 601 |
| nmuacc | "Number of observations in control group for MUAC analysis" | int | 6 | 50.33 | 37.87 | 7 | 28 | 36.5 | 93 | 101 |
| nmuacc2 | "Final number of observations control group for MUAC analysis" | int | 7 | 57.14 | 38.98 | 7 | 28 | 40 | 98 | 101 |
| nmuacc_c | "Number of observations in control group for MUAC analysis from TMSDG" | int | 5 | 70.6 | 36.76 | 28 | 33 | 93 | 98 | 101 |
| nmuacc_c2 | "Number of observations in control group for MUAC analysis from TMDCG" | int | 5 | 70.6 | 36.76 | 28 | 33 | 93 | 98 | 101 |
| nmuact | "Number of observations in treatment group for MUAC analysis" | int | 6 | 52.5 | 39.22 | 6 | 31 | 38.5 | 95 | 106 |
| nmuact2 | "Final number of observations in treatment group for MUAC analysis" | int | 7 | 59.29 | 40.05 | 6 | 31 | 40 | 100 | 106 |
| nmuact_c | "Number of observations in treatment group for MUAC analysis from TMSDG" | int | 5 | 73.8 | 36.6 | 31 | 37 | 95 | 100 | 106 |
| nmuact_c2 | "Number of observations in treatment group for MUAC analysis from TMDCG" | int | 5 | 73.8 | 36.6 | 31 | 37 | 95 | 100 | 106 |
| nweightc | "Number of observations in control group for weight analysis" | int | 28 | 140.5 | 173.6 | 1 | 30.5 | 51 | 221 | 631 |
| nweightc2 | "Final number of observations control group for weight analysis" | int | 27 | 148 | 173.5 | 4 | 33 | 56 | 298 | 631 |
| nweightc_c | "Number of observations in control group for weight analysis from TMSDG" | int | 12 | 109.5 | 136.8 | 24 | 30.5 | 50.5 | 104 | 444 |
| nweightc_c2 | "Number of observations in control group for weight analysis from TMDCG" | int | 21 | 133.5 | 173.5 | 24 | 37 | 54 | 110 | 631 |
| nweightt | "Number of observations in treatment group for weight analysis" | int | 28 | 148.4 | 181.7 | 1 | 37 | 59.5 | 222.5 | 601 |
| nweightt2 | "Final number of observations in treatment group for weight analysis" | int | 27 | 154 | 183 | 8 | 37 | 56 | 305 | 601 |
| nweightt_c | "Number of observations in treatment group for weight analysis from TMSDG" | int | 12 | 123.8 | 174 | 24 | 34 | 51.5 | 108 | 601 |
| nweightt_c2 | "Number of observations in treatment group for weight analysis from TMDCG" | int | 21 | 140 | 185.8 | 24 | 37 | 50 | 116 | 601 |
| peheight | "Point estimate of deworming on child height (cm)" | float | 25 | .3003 | .6218 | -.41 | -.0292 | .08 | .4 | 2.4 |
| peheight2 | "Final point estimate of deworming on child height (cm)" | float | 22 | .106 | .501 | -1.19 | -.06684 | .05 | .2181 | 1.348 |
| peheight_c | "Point estimate of deworming on child height (cm) from TMSDG" | float | 10 | .053 | .6148 | -1.19 | -.1 | .03 | .4 | 1.19 |
| peheight_c2 | "Point estimate of deworming on child height (cm) from TMDCG" | float | 16 | .05194 | .4895 | -1.19 | -.0976 | .06 | .2545 | 1.19 |
| pehemob | "Point estimate of deworming on hemoglobin (g/dl)" | float | 15 | .1284 | .2863 | -.2054 | -.043 | .006984 | .2689 | 1 |
| pehemob2 | "Final point estimate of deworming on hemoglobin (g/dl)" | float | 13 | .08721 | .1455 | -.08 | -.029 | .006984 | .2 | .3 |
| pehemob_c | "Point estimate of deworming on hemoglobin (g/dl) from TMSDG" | float | 9 | .03 | .1344 | -.1 | -.07 | 0 | .03 | .3 |
| pehemob_c2 | "Point estimate of deworming on hemoglobin (g/dl) from TMDCG" | float | 12 | .06667 | .1549 | -.1 | -.055 | .005 | .235 | .3 |
| pemuac | "Point estimate of deworming on MUAC (cm)" | float | 6 | .2457 | .3016 | 0 | .08 | .1 | .4 | .7942 |
| pemuac2 | "Final point estimate of deworming on MUAC (cm)" | float | 7 | .1606 | .3557 | -.35 | 0 | .1 | .4 | .7942 |
| pemuac_c | "Point estimate of deworming on MUAC (cm) from TMSDG" | float | 5 | .046 | .2685 | -.35 | 0 | .08 | .1 | .4 |
| pemuac_c2 | "Point estimate of deworming on MUAC (cm) from TMDCG" | float | 5 | .046 | .2685 | -.35 | 0 | .08 | .1 | .4 |
| peweight | "Point estimate of deworming on child weight (kg)" | float | 28 | .09361 | .426 | -1.3 | 0 | .08615 | .2174 | .98 |
| peweight2 | "Final point estimate of deworming on child weight (kg)" | float | 27 | .1398 | .3474 | -.66 | .01 | .1295 | .2337 | .98 |
| peweight_c | "Point estimate of deworming on child weight (kg) from TMSDG" | float | 13 | .1495 | .4232 | -.45 | -.01 | 0 | .17 | .98 |
| peweight_c2 | "Point estimate of deworming on child weight (kg) from TMDCG" | float | 21 | .1417 | .4022 | -.66 | 0 | .04 | .3473 | .98 |
| pre2000 | "" | byte | 34 | .4412 | .504 | 0 | 0 | 0 | 1 | 1 |
| prevalence_exact | "Worm infection prevalence" | double | 33 | .5467 | .3041 | .01 | .38 | .58 | .7621 | .97 |
| prevalence_exact2 | "" | float | 24 | .5304 | .323 | .01 | .215 | .555 | .805 | .97 |
| seheight | "S.E. of the effect of deworming on child height (cm)" | float | 25 | .3135 | .2188 | .06266 | .1628 | .285 | .4021 | 1.032 |
| seheight2 | "Final S.E. of the effect of deworming on child height (cm)" | float | 22 | .3255 | .2538 | .08212 | .1629 | .2775 | .4442 | 1.204 |
| seheight_c | "S.E. of the effect of deworming on child height (cm) from TMSDG" | float | 10 | .4749 | .4155 | .08621 | .1629 | .3154 | .6371 | 1.204 |
| seheight_c2 | "S.E. of the effect of deworming on child height (cm) from TMDCG" | float | 16 | .4561 | .3686 | .09823 | .2127 | .3154 | .513 | 1.204 |
| sehemob | "S.E. of the effect of deworming on hemoglobin (g/dl)" | float | 15 | .1626 | .08821 | .04094 | .09549 | .129 | .2627 | .3294 |
| sehemob2 | "Final S.E. of the effect of deworming on hemoglobin (g/dl)" | float | 13 | .1532 | .09003 | .04094 | .09549 | .1285 | .1541 | .3294 |
| sehemob_c | "S.E. of the effect of deworming on hemoglobin (g/dl) from TMSDG" | float | 9 | .164 | .09559 | .04104 | .129 | .1541 | .1689 | .3294 |
| sehemob_c2 | "S.E. of the effect of deworming on hemoglobin (g/dl) from TMDCG" | float | 12 | .1867 | .09027 | .04104 | .1288 | .1546 | .2658 | .3294 |
| semuac | "S.E. of the effect of deworming on MUAC (cm)" | float | 6 | .1516 | .1046 | .05812 | .06403 | .1292 | .215 | .3143 |
| semuac2 | "Final S.E. of the effect of deworming on MUAC (cm)" | float | 7 | .152 | .09551 | .05812 | .06452 | .154 | .215 | .3143 |
| semuac_c | "S.E. of the effect of deworming on MUAC (cm) from TMSDG" | float | 5 | .1383 | .06827 | .06452 | .07021 | .154 | .1876 | .215 |
| semuac_c2 | "S.E. of the effect of deworming on MUAC (cm) from TMDCG" | float | 5 | .1383 | .06827 | .06452 | .07021 | .154 | .1876 | .215 |
| seweight | "S.E. of the effect of deworming on child weight (kg)" | float | 28 | .2011 | .287 | -.04325 | .09044 | .1333 | .1852 | 1.568 |
| seweight2 | "Final S.E. of the effect of deworming on child weight (kg)" | float | 27 | .1578 | .09788 | .04936 | .09 | .1361 | .1842 | .4487 |
| seweight_c | "S.E. of the effect of deworming on child weight (kg) from TMSDG" | float | 13 | .185 | .1165 | .071 | .1059 | .148 | .2265 | .4718 |
| seweight_c2 | "S.E. of the effect of deworming on child weight (kg) from TMDCG" | float | 21 | .2556 | .317 | .0504 | .1059 | .1665 | .265 | 1.544 |

## Variable type: Categorical

| Name | Label | Value label | Complete obs | Number of levels | Number of unlabeled levels | Top count |
|---|---|---|---|---|---|---|
| Prevalence | "" | prevlabel | 33 | 3 | 0 | Worm Prevalence >= 50:20 Worm Prevalence < 20:7 20 <= Worm Prevalence < 50:6 |
| Prevalence2 | "RECODE of Prevalence" | prev2label | 33 | 2 | 0 | Worm Prevalence >= 20:26 Worm Prevalence < 20:7 |
| theight | "Type of estimate for height" | estimates | 27 | 3 | 0 | diff-in-diff:22 ANCOVA:4 endline comparison:1 |
| themob | "Type of estimate for hemoglobin" | estimates | 15 | 3 | 0 | diff-in-diff:9 ANCOVA:3 endline comparison:3 |
| tmuac | "Type of estimate for MUAC" | estimates | 7 | 2 | 0 | diff-in-diff:6 ANCOVA:1 |
| tweight | "Type of estimate for weight" | estimates | 31 | 2 | 0 | diff-in-diff:26 ANCOVA:5 |

