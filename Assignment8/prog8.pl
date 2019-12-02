#!/usr/local/bin/perl
sub dump() {
    my ($i, $j);
    print(sprintf("%s\n", $head));
    for ($i = 0; $i < $size ; $i++) {
        $l = "";
                for ($j = 0; $j < $size; $j++) {
                        if ( $bd[$i * $size + $j] ) {
                                $l .= " O";
                        } else {
                                $l .= " -";
                        }
                }
                print(sprintf("%s\n",$l));
        }
}
sub initBd() {
    for ($i = 0; $i < $size ; $i++) {
                for ($j = 0; $j < $size; $j++) {
            $bd[$i * $size + $j] = 0;
        }
    }
}
sub isValidPos() {
    my ($x, $y) = @_;
    my ($i, $c, $j0, $j1);
        for ($i = $x-1, $c = 1; $i >= 0; $i--, $c++) {
                if ($bd[$i * $size + $y]){
                        return 0;
                }
                $j0 = $y - $c;
                if ($j0 >= 0 && $bd[ $i * $size + $j0] ){
                        return 0;
                }
                $j1 = $y + $c;
                if ($j1 < $size && $bd[$i * $size + $j1] ){
                        return 0;
                }
        }
        return 1;
}
sub checkPos() {
    my ($x, $y) = @_;
    my ($j);
        for ( $j = $y; $j < $size ; $j++) {
                if ( &isValidPos($x, $j)) {
                        $bd[$x * $size + $j] = 1;
                        if ($x + 1 >= $size ) {
                                &dump();
                                $bd[$x * $size + $j] = 0;
 				             return 0;
                        }
                        if (! &checkPos($x+1, 0)) {
                return 0;
            }
                        $bd[$x * $size + $j] = 0;
                }
        }
    return 1;
}
sub main() {
    $size = 8;
    for ($i = 0; $i <= $#ARGV; $i++) {
        if ("-s" eq $ARGV[$i]) {
            $i++;
            $size = $ARGV[$i];
        } 
    }
    $head = "";
    for ($i = 0; $i < $size; $i++) {
                $head .= "--";
        }
    &initBd();
    $t1 = time();
    &checkPos(0, 0);
    $t2 = time();
    print(sprintf("Elapsed time = %d\n", ($t2 - $t1) * 1000 ));
}
&main();
exit(0);