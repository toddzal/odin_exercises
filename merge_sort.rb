def merge_sort(arr)
    if arr.length <2 
        return arr
    elsif arr.length == 2
        if arr[0] > arr[1]
            return [arr[1], arr[0]]
        else
            return arr
        end
    else
        #sort left
        l = merge_sort(arr[0, (arr.length/2)+ arr.length % 2])

        #sort right
        r = merge_sort(arr[(arr.length/2)+ arr.length % 2, arr.length])
        #merge
        first = l[0] < r[0] ? l[0]: r[0] 
        if r.length == 1
            last = l[1] < r[0] ? r[0] : l[1]
            mid = r[0] < l[0]? :l[0]: r[0] < l[1]? r[0]: l[1]
        else
            last = l[1] < r[1] ? r[1] : l[1]
            mid = merge_sort([l[0] < r[0] ? r[0]: l[0], l[1] < r[1] ? l[1] : r[1] ])
        end
        
        #last = l[1] < r[1] ? r[1] : l[1]
        p [first, mid, last].flatten
    end
end

#merge_sort([5,12,87,1,2,75,9,5,42,111,18,56,108])
#merge_sort([5, 270, 41])

def new_merge(arr)
    if arr.length <2 
        return arr
    # elsif arr.length == 2
    #     if arr[0] > arr[1]
    #         return [arr[1], arr[0]]
    #     else
    #         return arr
    #     end
    else
        #sort left
        l = new_merge(arr[0, (arr.length/2)+ arr.length % 2])
        #sort right
        r = new_merge(arr[(arr.length/2)+ arr.length % 2, arr.length])
        #merge
        num_times = l.length + r.length
        l_place = 0
        r_place = 0
        merged_array =[]
        num_times.times {
            if l_place == l.length
                merged_array.push(r[r_place, r.length])
                elsif r_place == r.length
                merged_array.push(l[l_place, l.length])    
                elsif l[l_place] < r[r_place]
                merged_array.push(l[l_place])
                l_place += 1
            else
                merged_array.push(r[r_place])
                r_place += 1
            end
        }
        return merged_array.flatten
    end
end

p new_merge([5, 270, 41, 7, 90, 15, 800, 1])