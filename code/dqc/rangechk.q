\d .dqc
rangechk:{[tn;colslist;tlower;tupper;thres]
  / Check that values of specified columns colslist in table (name) tn are
  / within the range defined by the tables tlower and tupper.
  if[0=count colslist; :(0b; "ERROR: No columns specified in colslist.")];
  tab: get tn;
  colslist:((),colslist) except exec c from meta tab where t in "csSC ";  / exclude columns that do not have pre-defined limits
  tupper:colslist#tupper;
  tlower:colslist#tlower;
  d:sum[tt within (tlower;tupper)]*100%count tt:colslist#tab; / dictionary with results by columns
  $[count b:where d<thres;
    (0b;"Following columns below threshold: ",(", " sv string b),".");
    (1b;"No columns below threshold.")
    ]
  }
