# TODO

## Tufte-style histogram

Tufte has this cool histogram style where the bin value is essentially marking the bar height. So instead of marking the top of a bar, with the bin label under it, you mark the top of the bin with the bin label. Could probably use `stat_bin` and `geom_text`?

Actually this doesn't look all that good if the bars don't follow a nice smooth distribution...
