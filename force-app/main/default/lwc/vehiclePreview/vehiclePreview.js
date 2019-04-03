import { LightningElement, track, api } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';

import animations from '@salesforce/resourceUrl/previewAnimations';

import FLARE from '@salesforce/resourceUrl/flare';
import FLINT from '@salesforce/resourceUrl/flint';
import FLASH from '@salesforce/resourceUrl/flash';

export default class VehiclePreview extends LightningElement {

    @track componentStyle = '';
    @track photoStyle = '';
    @track photoUrl = '';

    stylesLoaded = false;

    @api
    set model(value) {            
            this.photoUrl = this.urlSwitcher(value);
            this.photoStyle = `animation-name: driveIn`;        
    }
    
    get model() {
        return undefined;
    }

    @api 
    set background(value) {
        if (value === 'Cityscape') {
            this.componentStyle = `background-image: url('https://s3.amazonaws.com/platformers/cityscape.png');`;
        } else {
            this.componentStyle = '';
        }
    }
    get background() {
        return undefined;
    }

    async renderedCallback() {
        if (this.stylesLoaded) {
            return;
        }
        await loadStyle(this, animations);
        this.stylesLoaded = true;
    }

    urlSwitcher = value => {
        if (value === 'Flint') {
            return FLINT;
        } else if (value === 'Flash') {
            return FLASH;
        }
        return FLARE;
    }
}