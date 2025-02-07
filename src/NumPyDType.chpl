
module NumPyDType
{
    /* In chapel the types int and real defalut to int(64) and real(64).
       We also need other types like float32, int32, etc */
    enum DType {Int64, Float64, Bool, UNDEF}; 

    /* 
    Take a chapel type and returns the matching DType 

    :arg etype: chapel type

    :returns: DType
    */
    proc whichDtype(type etype) param : DType {
      if (etype == int) {return DType.Int64;}
      if (etype == real) {return DType.Float64;}
      if (etype == bool) {return DType.Bool;}
      return DType.UNDEF; // undefined type
    }

    /* Returns the size in bytes of a DType 

    :arg dt: (pythonic) DType
    :type dt: DType

    :returns: (int)
    */
    proc dtypeSize(dt: DType): int {
      if (dt == DType.Int64) { return 8; }
      if (dt == DType.Float64) { return 8; }
      if (dt == DType.Bool) { return 1; }
      return 0;
    }

    /* Turns a dtype string in pythonland into a DType 

    :arg dstr: pythonic dtype to be converted
    :type dstr: string

    :returns: DType
    */
    proc str2dtype(dstr:string): DType {
        if dstr == "int64" {return DType.Int64;}
        if dstr == "float64" {return DType.Float64;}        
        if dstr == "bool" {return DType.Bool;}        
        return DType.UNDEF;
    }
    
    /* Turns a DType into a dtype string in pythonland 

    :arg dtype: DType to convert to string
    :type dtype: DType

    :returns: (string)
    */
    proc dtype2str(dtype:DType): string {
        if dtype == DType.Int64 {return "int64";}
        if dtype == DType.Float64 {return "float64";}        
        if dtype == DType.Bool {return "bool";}        
        return "UNDEF";
    }

}
